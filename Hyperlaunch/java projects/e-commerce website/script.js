
const productsData = [
    { id: 1, name: "Lipstick", price: 20, category: "Lips", image: "lipstick.jpg" },
    { id: 2, name: "Foundation", price: 35, category: "Face", image: "foundation.jpg" },
    { id: 3, name: "Eyeshadow Palette", price: 50, category: "Eyes", image: "eye.jpg" },
    { id: 4, name: "Blush", price: 25, category: "Face", image: "blush.jpg" },
    { id: 5, name: "Mascara", price: 15, category: "Eyes", image: "mascara.jpg" },
    { id: 6, name: "Lip Gloss", price: 18, category: "Lips", image: "lip gloss.jpg" }
];


let cart = JSON.parse(localStorage.getItem("cart")) || [];


function updateCartCount() {
    document.querySelectorAll("#cart-count").forEach(el => {
        el.textContent = cart.length;
    });
}
updateCartCount();


function renderProducts(containerId, products) {
    const container = document.getElementById(containerId);
    if (!container) return;

    container.innerHTML = "";

    products.forEach(p => {
        const div = document.createElement("div");
        div.className = "product";

        div.innerHTML = `
            <img src="images/${p.image}" alt="${p.name}">
            <h3>${p.name}</h3>
            <p>$${p.price}</p>
            <button onclick="addToCart(${p.id})">Add to Cart</button>
        `;

        container.appendChild(div);
    });
}


const searchInput = document.getElementById("search");
const categoryFilter = document.getElementById("category-filter");
const sortSelect = document.getElementById("sort");

if (categoryFilter) {
    const categories = ["all", ...new Set(productsData.map(p => p.category))];
    categories.forEach(cat => {
        const option = document.createElement("option");
        option.value = cat;
        option.textContent = cat;
        categoryFilter.appendChild(option);
    });
}

function getFilteredProducts() {
    let filtered = [...productsData];

    if (searchInput && searchInput.value !== "") {
        filtered = filtered.filter(p =>
            p.name.toLowerCase().includes(searchInput.value.toLowerCase())
        );
    }

    if (categoryFilter && categoryFilter.value !== "all") {
        filtered = filtered.filter(p => p.category === categoryFilter.value);
    }

    if (sortSelect) {
        if (sortSelect.value === "low") {
            filtered.sort((a, b) => a.price - b.price);
        } else if (sortSelect.value === "high") {
            filtered.sort((a, b) => b.price - a.price);
        }
    }

    return filtered;
}

if (searchInput) {
    searchInput.addEventListener("input", () =>
        renderProducts("products", getFilteredProducts())
    );
}

if (categoryFilter) {
    categoryFilter.addEventListener("change", () =>
        renderProducts("products", getFilteredProducts())
    );
}

if (sortSelect) {
    sortSelect.addEventListener("change", () =>
        renderProducts("products", getFilteredProducts())
    );
}

function addToCart(id) {
    const product = productsData.find(p => p.id === id);
    if (!product) return;

    cart.push(product);
    localStorage.setItem("cart", JSON.stringify(cart));
    updateCartCount();
    alert("Product added to cart!");
}


function renderCartPage() {
    const cartItems = document.getElementById("cart-items");
    const totalEl = document.getElementById("total");

    if (!cartItems || !totalEl) return;

    cartItems.innerHTML = "";
    let total = 0;

    cart.forEach((item, index) => {
        total += item.price;

        const li = document.createElement("li");
        li.innerHTML = `
            ${item.name} - $${item.price}
            <button onclick="removeFromCart(${index})">Remove</button>
        `;
        cartItems.appendChild(li);
    });

    totalEl.textContent = total;
}

function removeFromCart(index) {
    cart.splice(index, 1);
    localStorage.setItem("cart", JSON.stringify(cart));
    updateCartCount();
    renderCartPage();
}


const checkoutBtn = document.getElementById("checkout-btn");
if (checkoutBtn) {
    checkoutBtn.addEventListener("click", () => {
        if (cart.length === 0) {
            alert("Your cart is empty!");
            return;
        }
        window.location.href = "checkout.html";
    });
}


const checkoutForm = document.getElementById("checkout-form");
if (checkoutForm) {
    checkoutForm.addEventListener("submit", e => {
        e.preventDefault();
        alert("Order placed successfully!");
        cart = [];
        localStorage.setItem("cart", JSON.stringify(cart));
        updateCartCount();
        window.location.href = "index.html";
    });
}

renderProducts("featured-products", productsData);
renderProducts("products", productsData);
renderCartPage();
