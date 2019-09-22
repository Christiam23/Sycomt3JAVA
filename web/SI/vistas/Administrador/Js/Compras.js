$(document).ready(function () {
    listar();
    Print();
    listarProveedor();


});
var listar = function () {
    var table = $("#tableCrud").DataTable({

        destroy: true,
        order: [[0, "desc"]],
        ajax: {
            method: "POST",
            url: "../../controllerCompras?accion=listShop",
            dataSrc: "datos"
        },
        columns: [
            {data: "Codigo"},
            {data: "Fecha"},
            {data: "proveedor"},
            {data: "obs"},
            {data: "Valor"},
            {data: "Estado"},
            {data: "acciones"}
        ],
        language: idiomaEsp
    });
}

var Print = function () {
    var data = "";
    $.ajax({
        method: "POST",
        url: "../../methodProduct?accion=list",
        data: data,
        dataSrc: "datos",
        dataType: "json",
        success: function (data) {
            $.each(data.datos, function (i, field) {
                $('#stockShop').append(' <div class="col-md-4"><div class="card"><img class="card-img-top" src="../../' + field.Imagen + '" alt="' + field.Nombre + '"><div class="card-block"><h4 class="card-title">' + field.Nombre + '</h4><p class="card-text">Precio: $' + field.Precio + ' Mt²</p><a href="#" id = "' + field.Codigo + '"data-name="' + field.Nombre + '" data-price="' + field.Precio + '" class="add-to-cart btn colorbtn btn-primary">Añadir al carrito</a></div></div></div>');
            });
        }
    });
}

var listarProveedor = function () {
    var data = "";
    $.ajax({
        url: "../../processProveedor?accion=listarProveedores",
        type: "post",
        data: data,
        dataSrc: "datos",
        dataType: "json",
        success: function (data) {

            $.each(data.datos, function (i, field) {
                $('#proveedorShop').append(' <option value="' + field.idProveedor + '">' + field.razonSocial + '</option>')
            });
        }
    });
};

//$('#boton').click(function () {
//    console.log($('.select1').val());
//
//});

$('#btnOrderNow').click(function (e) {
    $('#frmShop').bootstrapValidator({
        feedbackIcons: {valid: 'glyphicon glyphicon-ok', invalid: 'glyphicon glyphicon-remove', validating: 'glyphicon glyphicon-refresh'},
        fields: {
            proveedorShop: {
                validators: {
                    notEmpty: {message: 'Seleccione un proveedor'},

                }
            },
            decripcionShop: {
                validators: {
                    notEmpty: {message: 'Ingrese la descripción'}

                }
            }

        }

    });
});
$('#frmShop').on('success.form.bv', function (e) {
    e.preventDefault();
    var cartArrayOrder = shoppingCart.listCart();
    var detailsShop = "";
    var totalShop = shoppingCart.totalCart();
    var proveedorShop = $('#proveedorShop').val();
    var descripcionShop = $('#decripcionShop').val();
    if (cartArrayOrder.length > 0) {
        for (var i in cartArrayOrder) {
            detailsShop += cartArrayOrder[i].idSis + "," + cartArrayOrder[i].count + "," + cartArrayOrder[i].total + ";";
        }
        $('#detailsShop').val(detailsShop);
        $('#totalShop').val(totalShop);
        var data = new FormData($('#frmShop')[0]);

        for (var entrie of data.entries()) {
            console.log(entrie[0] + ': ' + entrie[1]);
        }



        $.ajax({
            url: "../../controllerCompras?accion=newShop",
            type: "post",
            data: data,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        //error
                        type: 'success',
                        title: '¡ Compra registrada exitosamente ! ',
                        width: 500,
                        padding: '5em',
                        showConfirmButton: false,
                        timer: 2000 //el tiempo que dura el mensaje en ms
                    });
                    $("#frmShop")[0].reset();
                    $("#frmShop").data('bootstrapValidator').resetForm();
                    $('#cart').modal('toggle');
                    shoppingCart.clearCart();
                    displayCart();
                    listar();
                } else {
                    Swal.fire({
                        //error
                        type: 'error',
                        title: '¡Error al Registrar! ',
                        text: 'Intentelo de nuevo',
                        width: 500,
                        padding: '5em',
                        showConfirmButton: false,
                        timer: 4000 //el tiempo que dura el mensaje en ms
                    });
                    $('#btnOrderNow').attr("disabled", false);
                    listar();
                }

            }
        });

    } else {

        Swal.fire({
            //error
            type: 'error',
            title: '¡El Carrito Esta Vacio! ',
            text: 'Seleccione los productos que desea solicitar a su proveedor',
            width: 500,
            padding: '10em',
            showConfirmButton: false,
            timer: 4000 //el tiempo que dura el mensaje en ms
        });
        $('#btnOrderNow').attr("disabled", false);
    }
});
$(document).on('click', '#closeModalCart', function (e) {
    $("#frmShop")[0].reset();
    $("#frmShop").data('bootstrapValidator').resetForm();
});


$(document).on('click', 'button.btnDetalles', function (e) {
    e.preventDefault();
    var idShop = $(this).attr("id");
    var data = ""
    $.ajax({
        url: "../../controllerCompras?accion=listDetailsShop&idShop=" + idShop + "",
        type: "post",
        data: data,
        dataSrc: "datos",
        dataType: "json",
        success: function (data) {
            $('#bodyDC').html("");
            $.each(data.datos, function (i, field) {
                $('#bodyDC').append("<tr><td>" + field.idProducto + "</td><td>" + field.nombreProducto + "</td><td>" + field.cantidad + "</td><td>" + field.precio + "</td></tr>");
                $("#modalDetalleVentas").modal("show");
            });
        }
    });
    $('#modalDetalleCompras').modal('show');
});
$(document).on('click', 'a.idproveedor', function (e) {
    var data = "";
    var idProveedorD = $(this).attr("id");
    $.ajax({
        url: "../../processProveedor?accion=listarProveedores",
        type: "post",
        data: data,
        dataSrc: "datos",
        dataType: "json",
        success: function (data) {
            $('#bodyDP').html("");
            $.each(data.datos, function (i, field) {
                if (idProveedorD == field.idProveedor) {
                    $('#bodyDP').append("<tr><td>" + field.razonSocial + "</td><td>" + field.nit + "</td>");
                    $("#modalDetallesProveedor").modal("show");
                }
            });
        }
    });
});


// ************************************************
// Shopping Cart API
// Seccion de cosigo para el carrito de compras
// ************************************************

var shoppingCart = (function () {
    // =============================
    // Private methods and propeties
    // =============================
    cart = [];

    // Constructor
    function Item(name, price, count, idSis) {
        this.name = name;
        this.price = price;
        this.count = count;
        this.idSis = idSis;
    }

    // Save cart
    function saveCart() {
        sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
    }

    // Load cart
    function loadCart() {
        cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
    }
    if (sessionStorage.getItem("shoppingCart") != null) {
        loadCart();
    }


    // =============================
    // Public methods and propeties
    // =============================
    var obj = {};

    // Add to cart
    obj.addItemToCart = function (name, price, count, idSis) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart[item].count++;
                saveCart();
                return;
            }
        }
        var item = new Item(name, price, count, idSis);
        cart.push(item);
        saveCart();
    }
    // Set count from item
    obj.setCountForItem = function (name, count) {
        for (var i in cart) {
            if (cart[i].name === name) {
                cart[i].count = count;
                break;
            }
        }
    };
    // Remove item from cart
    obj.removeItemFromCart = function (name) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart[item].count--;
                if (cart[item].count === 0) {
                    cart.splice(item, 1);
                }
                break;
            }
        }
        saveCart();
    }

    // Remove all items from cart
    obj.removeItemFromCartAll = function (name) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart.splice(item, 1);
                break;
            }
        }
        saveCart();
    }

    // Clear cart
    obj.clearCart = function () {
        cart = [];
        saveCart();
    }

    // Count cart 
    obj.totalCount = function () {
        var totalCount = 0;
        for (var item in cart) {
            totalCount += cart[item].count;
        }
        return totalCount;
    }

    // Total cart
    obj.totalCart = function () {
        var totalCart = 0;
        for (var item in cart) {
            totalCart += cart[item].price * cart[item].count;
        }
        return Number(totalCart.toFixed(2));
    }

    // List cart
    obj.listCart = function () {
        var cartCopy = [];
        for (i in cart) {
            item = cart[i];
            itemCopy = {};
            for (p in item) {
                itemCopy[p] = item[p];

            }
            itemCopy.total = Number(item.price * item.count).toFixed(2);
            cartCopy.push(itemCopy)
        }
        return cartCopy;
    }

    // cart : Array
    // Item : Object/Class
    // addItemToCart : Function
    // removeItemFromCart : Function
    // removeItemFromCartAll : Function
    // clearCart : Function
    // countCart : Function
    // totalCart : Function
    // listCart : Function
    // saveCart : Function
    // loadCart : Function
    return obj;
})();


// *****************************************
// Triggers / Events
// ***************************************** 
// Add item

$(document).on('click', '.add-to-cart', function (e) {

    event.preventDefault();
    var name = $(this).data('name');
    var idSis = $(this).attr('id');
    var price = Number($(this).data('price'));
    shoppingCart.addItemToCart(name, price, 1, idSis);
    displayCart();
});
$(document).on('click', '#openCart', function (e) {
    $('#modalCompraNueva').modal('toggle');
});
$(document).on('click', '#closeModalCart', function (e) {
    $('#modalCompraNueva').modal('show');
});


// Clear items
$('.clear-cart').click(function () {
    shoppingCart.clearCart();
    displayCart();
});

$(document).ready(function () {
    shoppingCart.clearCart();
    displayCart();


});
function displayCart() {
    var cartArray = shoppingCart.listCart();
    var output = "";

    for (var i in cartArray) {


        output += "<tr>"
                + "<td id='tdName'>" + cartArray[i].name + "</td>"
                + "<td>(" + cartArray[i].price + ")</td>"
                + "<td><div class='input-group row'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>"
                + "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>"
                + "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>"
                + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + ">X</button></td>"
                + " = "
                + "<td>" + Math.trunc(cartArray[i].total) + "</td>"
                + "</tr>"

                ;
    }

    $('.show-cart').html(output);

    $('.total-cart').html(shoppingCart.totalCart());
    $('.total-count').html(shoppingCart.totalCount());
}

// Delete item button

$('.show-cart').on("click", ".delete-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.removeItemFromCartAll(name);
    displayCart();
})


// -1
$('.show-cart').on("click", ".minus-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.removeItemFromCart(name);
    displayCart();
})
// +1
$('.show-cart').on("click", ".plus-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.addItemToCart(name);
    displayCart();
})

// Item count input
$('.show-cart').on("change", ".item-count", function (event) {
    var name = $(this).data('name');
    var count = Number($(this).val());
    shoppingCart.setCountForItem(name, count);
    displayCart();
});

displayCart();

