

const nameInput = document.getElementById('name');
const ageInput = document.getElementById('age');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const countryInput = document.getElementById('country');
const termsInput = document.getElementById('terms');
const form = document.getElementById('myForm');

nameInput.addEventListener('input', function() {
	if (this.value.trim().length < 3) {
		showError(this, "nameError", "Name must be at least 3 characters");
	}
	else {
		showSuccess(this, "nameError");
	}
});

ageInput.addEventListener('input', function() {
	if (this.value <=0) {
		showError(this, "ageError", "Age must be greater than zero")
	}
	else {
		showSuccess(this, "ageError")
	}
});

emailInput.addEventListener('input', function() {
	const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

	if (!regex.test(this.value)) {
		showError(this,"emailError", "InvalidEmail")
	}
	else {
		showSuccess(this, "emailError")
	}
});

passwordInput.addEventListener('input', function() {

	if (this.value < 6) {
		showError(this,"passwordError", "Password should be greater than 6")
	}
	else {
		showSuccess(this,"passwordError")
	}

});


countryInput.addEventListener('input', function() {

	if (!this.value) {
		showError(this, "countryError", "Select a country")
	}
	else {
		showSuccess(this, "countryError")
	}

});


form.addEventListener('submit', function(event) {
	event.preventDefault();


	if (!termsInput.checked) {
		document.getElementById('terms').innerText = "Accept Terms";
		return;

	}
	alert("Form Submitted successfully")

});

function showError(input, errorId, msg) {
	input.clasList.add('error');
	input.classList.remove('success');
	document.getElementById(errorId).innerText = "msg";	
}























