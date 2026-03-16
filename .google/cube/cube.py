import os

# This file allows you to extend Cube's behavior beyond environment variables
# For now, it just confirms the directory where your data models (cubes) live.
def cube_config(config):
    # This tells Cube where to look for your .yml or .js data models
    # By default, it looks in a folder called 'model'
    config.schema_path = 'model'
    return config
