from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):
    def create_user(self, email, username, password=None, *args, **kwargs):
        """Create the user by the email , contact number and password  and save into the database """
        if not email:
            raise ValueError("Users must have an email address")
        if not username:
            raise ValueError("Users must have a username")

        user = self.model(
            email=self.normalize_email(email), username=username, *args, **kwargs
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(email, username, password, *args, **kwargs)
        user.is_admin = True
        user.is_superuser = True
        user.save(using=self._db)
        return user

    def create_admin_user(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(email, username, password, *args, **kwargs)
        user.is_admin = True
        user.is_superuser = False
        user.save(using=self._db)
        return user

    def create_employee_user(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(
            email, username, password, is_customer=True, *args, **kwargs
        )
        user.is_seller = False
        user.is_admin = False
        user.is_superuser = False
        user.role = "Employee"
        user.save(using=self._db)
        return user

    def create_manager_user(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(
            email, username, password, is_seller=True, *args, **kwargs
        )

        user.is_admin = False
        user.is_superuser = False
        user.save(using=self._db)
        user.role = "Manager"
        return user

    def create_hr_user(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(
            email, username, password, is_seller=True, *args, **kwargs
        )

        user.is_admin = False
        user.is_superuser = False
        user.role = "HR"
        user.save(using=self._db)
        return user

    def create_hr_manager_user(self, email, username, password=None, *args, **kwargs):
        user = self.create_user(
            email, username, password, is_seller=True, *args, **kwargs
        )

        user.is_admin = True
        user.is_superuser = True
        user.role = "HRManager"
        user.save(using=self._db)
        return user
