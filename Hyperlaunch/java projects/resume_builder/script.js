function updateText(id, value) {
    document.getElementById(id).innerText = value || " ";
}

function loadPhoto(event) {
    const photo = document.getElementById("photo");
    photo.src = URL.createObjectURL(event.target.files[0]);
}

function updateSkills(value) {
    const skillsList = document.getElementById("skills");
    skillsList.innerHTML = "";

    value.split(",").forEach(skill => {
        if (skill.trim() !== "") {
            const li = document.createElement("li");
            li.innerText = skill.trim();
            skillsList.appendChild(li);
        }
    });
}
