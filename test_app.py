import unittest
from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_init_terraform(self):
        response = self.app.get('/init')
        data = response.get_json()

        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
