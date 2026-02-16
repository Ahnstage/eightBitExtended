---
layout: default
title: Contact
permalink: contact.html
---
# Hello!
Don't hesitate to reach out for inquiries, collaborations, or just a friendly hello. 

<form id="contact-form">
  <label for="name">Name</label>
  <input type="text" id="name" name="name" required>

  <label for="email">Email</label>
  <input type="email" id="email" name="email" required>

  <label for="message">Message</label>
  <textarea id="message" name="message" required></textarea>

  <input type="text" name="honeypot" style="display:none" tabindex="-1" autocomplete="off">

  <button type="submit">Send Message</button>
  <p id="form-status"></p>
</form>

<script>
  document.getElementById("contact-form").addEventListener("submit", function(e) {
    e.preventDefault();

    var form = e.target;
    var status = document.getElementById("form-status");
    var button = form.querySelector("button");

    button.disabled = true;
    button.textContent = "Sending...";
    status.textContent = "";

    var data = {
      name: form.name.value,
      email: form.email.value,
      message: form.message.value,
      honeypot: form.honeypot.value
    };

    fetch("https://script.google.com/macros/s/AKfycbzAezD07UvClNGc3HcARvIBcSwNoq6YBLT6yc_ttLhOlo-AcAv_9f0ZErVhzLCGaidYDQ/exec", {
      method: "POST",
      body: JSON.stringify(data)
    })
    .then(function(response) { return response.json(); })
    .then(function(result) {
      status.textContent = "Message sent. Thank you!";
      form.reset();
    })
    .catch(function(error) {
      status.textContent = "Something went wrong. Please try again.";
    })
    .finally(function() {
      button.disabled = false;
      button.textContent = "Send Message";
    });
  });
</script>