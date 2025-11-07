from flask import Flask, request, jsonify
import os

app = Flask(__name__)

# Directory to store uploaded models
UPLOAD_FOLDER = 'uploads/'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Ensure upload folder exists
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/upload', methods=['POST'])
def upload_model():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    file.save(os.path.join(app.config['UPLOAD_FOLDER'], file.filename))
    return jsonify({'message': 'Model uploaded successfully'}), 201

@app.route('/models', methods=['GET'])
def list_models():
    models = os.listdir(app.config['UPLOAD_FOLDER'])
    return jsonify(models), 200

@app.route('/models/<filename>', methods=['GET'])
def get_model(filename):
    return jsonify({'model': filename}), 200

if __name__ == '__main__':
    app.run(debug=True)
