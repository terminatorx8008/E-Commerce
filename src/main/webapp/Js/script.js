
/*global localStrorage*/
function checkconfirmPassword()
{
    let password = document.getElementById("password").value.trim();
    let Confirm_password = document.getElementById("confirm_Password").value.trim();
    if (password !== Confirm_password) {
        document.getElementById("message2").innerHTML = "Both the password must match, Enter the password correctly!!";
        document.getElementById("submit").disabled = true;
    } else {
        document.getElementById("message2").innerHTML = "";
        document.getElementById("submit").disabled = false;

    }

}

function checkPhoneNumber() {
    let phoneNumber = document.getElementById("phone").value.trim();
    var numbers = /^[0-9]+$/;
    let message = "";

    if (!numbers.test(phoneNumber)) {
        message = "Phone number should contain only number";
        document.getElementById("submit").disabled = true;

    } else if (phoneNumber.length > 10 && phoneNumber.length <= 15) {
        message = "Phone number should be of valid length";
        document.getElementById("submit").disabled = true;

    } else {
        message = "";
        document.getElementById("submit").disabled = false;

    }
    document.getElementById("message3").innerHTML = message;

}

function checkPassword() {
    let password = document.getElementById("password").value.trim();
    var numbers = /[0-9]/g;
    var upperCaseLetters = /[A-Z]/g;
    var lowerCaseLetters = /[a-z]/g;
    var specialSymbol = /[@,#,$,%,&,*]/g;
    let message = "";
    let flag = false;
    if (password.length < 4 || password.length > 16) {
        message = "Length of password must be: 4 < length < 16";
        document.getElementById("submit").disabled = true;

    } else if (!numbers.test(password)) {
        message = "Password must contain a numeric value";
        document.getElementById("submit").disabled = true;

    } else if (!upperCaseLetters.test(password)) {
        message = "Password must contain an uppercase letter";
        document.getElementById("submit").disabled = true;

    } else if (!lowerCaseLetters.test(password)) {
        message = "Password must contain a lowercase letter";
        document.getElementById("submit").disabled = true;

    } else if (!specialSymbol.test(password)) {
        message = "Password must contain a Special Symbol (@,#,$,%,&,*)";
        document.getElementById("submit").disabled = true;

    } else if (password.includes(" ")) {
        message = "Password cannot contain blank space";
        document.getElementById("submit").disabled = true;

    } else {
        flag = true;
        document.getElementById("submit").disabled = false;

    }

    document.getElementById("message1").innerHTML = message;
    return flag;
}

function addToCart(pId, pName, pPrice)
{
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("pahala item");
        showToast("Items Added Successfully!!");
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pId);

        if (oldProduct) {
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("pahala item ki quantity badi");
            showToast("Items Quantity Incressed Successfully!!");
        } else {
            let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("dusra item");
            showToast("Items Added Successfully!!");
        }
    }
    updateCart();
}
function updateCart() {
    let cart = JSON.parse(localStorage.getItem("cart"));
    if (cart == null || cart.length == 0) {
        console.log("cart is empty");
        $(".cart-item").html("0");
        $(".checkout-btn").addClass("disabled");
        $(".cart-body").html("<h3>No items added to the cart add items first</h3>");
    } else {
        console.log(cart);
        $(".cart-item").html(` ${cart.length}`);
        let table = `
            <table class='table table-hover table-striped px-2 md-2 table align-top text-center'>
                <thead class='thread-light'>
                    <tr class="row">
                        <th class="col-4">Items Name</th>
                        <th class="col">Price</th>
                        <th class="col">Quantity</th>
                        <th class="col">Total Price</th>
                        <th class="col">Action</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
        `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                    <tr class="row">
                        <td class="col-4">${item.productName}</td>
                        <td class="col-2">${item.productPrice}</td>  
                        <td class="col-2">${item.productQuantity}</td>
                        <td class="col-2">${item.productQuantity * item.productPrice}</td>
                        <td class="col-2"><button onclick="removeFromCart(${item.productId})" class="btn px-2 btn-danger">Remove</button></td>

                    </tr>
            `;
            totalPrice += item.productPrice * item.productQuantity;
        })
        table = table + `
                        <tr class="row"> 
                            <td class="col-12">Total price : ${totalPrice}</td>
                        </tr>
                    </tbody>
                        </table>                    
        `;
        $(".cart-body").html(table);
        $(".checkout-btn").removeClass("disabled");
    }
}

function removeFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newCart));
    showToast("Items Removed Successfully!!");
    updateCart();
}

$(document).ready(function ()
{
    updateCart();
}
);
function showToast(message) {
    const toast = new bootstrap.Toast(document.getElementById('myToast'));
    document.querySelector('.toast-body').textContent = message;
    toast.show();
}

