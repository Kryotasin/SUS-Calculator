function showHide(inputId) {
  var x = document.getElementById(inputId);
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

function createQuestionForm() {
  // Number of inputs to create
  var users = document.getElementById('userCount').value;
  var questions = document.getElementById('questionCount').value;

  alert("Test" + users);

  document.getElementById('userCount').value = "";

  var form = document.getElementById('container');

  while (form.hasChildNodes()) {
    form.removeChild(form.lastChild);
  }

  for (j = 0; j < users; j++) {
    var form = document.createElement("form");
    form.className = "form-horizontal";
    container.appendChild(form);

    var legend = document.createElement("legend");
    legend.innerHTML = "Enter Data for User " + (j + 1);
    form.appendChild(legend);


    for (i = 0; i < questions; i++) {
      //form-group
      var class1 = document.createElement("div");
      class1.className = "form-group";
      form.appendChild(class1);

      //label
      var label = document.createElement("label");
      label.className = "col-md-4 control-label";
      label.innerHTML = "Question Number" + (i + 1) + ": ";
      label.htmlFor = "member" + i;
      class1.appendChild(label);

      //second div
      var class2 = document.createElement("div");
      class2.className = "col-md-2";
      class1.appendChild(class2);


      // Create an <input> element, set its type and name attributes
      var input = document.createElement("input");
      input.type = "number";
      input.name = "member" + i;
      input.className = "form-control input-md";
      class2.appendChild(input);
    }
  }
}
