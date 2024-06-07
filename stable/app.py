# app.py (Stable)
from flask import Flask, jsonify, request, render_template
#comments for the demo
app = Flask(__name__)

# Route for the homepage
@app.route('/')
def home():
    return "This is the stable version"

# Route for a simple JSON response
@app.route('/api/data', methods=['GET'])
def get_data():
    data = {
        'message': 'Hello, this is the stable version of the API!',
        'status': 'success'
    }
    return jsonify(data)

# Route for a form submission (GET and POST methods)
@app.route('/submit', methods=['GET', 'POST'])
def submit_form():
    if request.method == 'POST':
        name = request.form['name']
        return f"Form submitted! Hello, {name}!"
    return render_template('form.html')

# Route for handling a user profile
@app.route('/profile/<username>', methods=['GET'])
def profile(username):
    return f"Welcome to {username}'s profile!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
