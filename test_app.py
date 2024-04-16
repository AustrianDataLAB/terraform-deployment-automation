import unittest
from unittest.mock import patch
from app import app

class FlaskTestCase(unittest.TestCase):

    def setUp(self):
        # Setting up the Flask test client
        self.app = app.test_client()
        self.app.testing = True

    def test_home(self):
        # Test the home route
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), "Hello, Flask!")

    def test_get_data(self):
        # Test the data retrieval route
        response = self.app.get('/api/data')
        self.assertEqual(response.status_code, 200)
        self.assertDictEqual(response.json, {'name': 'Flask', 'type': 'Framework', 'language': 'Python'})

    @patch('app.Terraform')
    def test_init_terraform(self, mock_terraform):
        # Mock the Terraform init method
        instance = mock_terraform.return_value
        instance.init.return_value = (0, 'init output', 'no errors')
        response = self.app.get('/init')
        self.assertEqual(response.status_code, 200)
        self.assertDictEqual(response.json, {'return_code': 0, 'stdout': 'init output', 'stderr': 'no errors'})

    @patch('app.Terraform')
    def test_apply_terraform(self, mock_terraform):
        # Mock the Terraform apply method
        instance = mock_terraform.return_value
        instance.apply.return_value = (0, 'apply output', 'no errors')
        response = self.app.get('/apply')
        self.assertEqual(response.status_code, 200)
        self.assertDictEqual(response.json, {'return_code': 0, 'stdout': 'apply output', 'stderr': 'no errors'})

if __name__ == '__main__':
    unittest.main()
