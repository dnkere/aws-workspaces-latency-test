# create_aws_user.py

import boto3

def create_user(directory_id, user_name, given_name, surname, display_name, password):
    client = boto3.client('ds')

    response = client.create_user(
        DirectoryId=directory_id,
        UserName=user_name,
        GivenName=given_name,
        Surname=surname,
        DisplayName=display_name,
        Password=password
    )
    
    return response

if __name__ == "__main__":
    # Sample user data
    directory_id = 'data.aws_directory_service_directory.latency_test_directory.id'  # Replace with your directory ID
    user_name = 'var.user_name'
    given_name = 'var.given_name'
    surname = 'var.surname'
    display_name = 'var.display_name'
    password = 'var.workspace_user_password'
    
    # Create the user
    result = create_user(directory_id, user_name, given_name, surname, display_name, password)
    print(f"User {user_name} created successfully.")
