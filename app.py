from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/api/data')
def get_data():
    data = {"name": "Flask", "type": "Framework", "language": "Python"}
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
