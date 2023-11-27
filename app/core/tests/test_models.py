"""
Tests for models 
"""


from django.test import TestCase
from django.contrib.auth import get_user_model


class ModelTests(TestCase): 
    """ Test Model """
    
    def test_create_user_with_email_successful(self):
        email = "test@eamile.com"
        password = "testpass1234"
        user = get_user_model().objects.create_user(
            email=email,
            password=password,
        )
 
        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))
