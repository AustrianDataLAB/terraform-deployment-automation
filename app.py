from flask import Flask, jsonify
app = Flask(__name__)
from python_terraform import Terraform

@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/api/data')
def get_data():
    data = {"name": "Flask", "type": "Framework", "language": "Python"}
    return jsonify(data)

@app.route('/init')
def init_terraform():
    tf = Terraform(working_dir='./')  # Adjust the working directory if needed
    code, stdout, stderr = tf.init()
    return jsonify({
        'return_code': code,
        'stdout': stdout,
        'stderr': stderr
    })

@app.route('/apply')
def apply_terraform():
    tf = Terraform(working_dir='./')
    code, stdout, stderr = tf.apply(skip_plan=True)  # Automatically approves the plan
    return jsonify({
        'return_code': code,
        'stdout': stdout,
        'stderr': stderr
    })

if __name__ == '__main__':
    app.run(debug=True)
