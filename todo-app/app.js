const input = document.getElementById("taskInput");
const addButton = document.getElementById("addBtn");
const taskList = document.getElementById("taskList");

addButton.addEventListener("click", function () {
    const taskText = input.value;

    if (taskText === "") {
        alert("Please enter a task!");
        return;
    }

    const listItem = document.createElement("li");
    listItem.textContent = taskText;

    const doneButton = document.createElement("button");
    doneButton.textContent = "Done";

    doneButton.addEventListener("click", function () {
        listItem.style.textDecoration = "line-through";
    });

    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";

    deleteButton.addEventListener("click", function () {
        listItem.remove();
    });

    listItem.appendChild(doneButton);
    listItem.appendChild(deleteButton);

    taskList.appendChild(listItem);

    input.value = "";
});