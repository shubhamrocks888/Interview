###

fetch("/url",{
	method: "POST",
	headers: { "Content-Type": "application/json"},
	body: JSON.stringify(data)

})
.then(res => res.json())
.then(data => console.log(data))



####

fetch("/submit", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(payload)
  })
  .then(res => res.json())
  .then(response => {
    if (response.success) {
      alert("Form submitted successfully");
      form.reset();
    } else {
      alert(response.error || "Submission failed");
    }
  })
  .catch(error => {
    console.log(error);
    alert("Server error");
  });
});


###


const payload = {
    name: $("#name").val(),
    email: $("#email").val(),
    password: $("#password").val()
  };


$.ajax({
    url: "/submit",
    method: "POST",
    contentType: "application/json",
    data: JSON.stringify(payload),

    success: function (response) {
      if (response.success) {
        alert("Form submitted");
        $("#myForm")[0].reset();
      } else {
        alert(response.error);
      }
    },

    error: function () {
      alert("Server error");
    }
  });
});

######


