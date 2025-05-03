from setuptools import find_packages, setup
import glob
import os

package_name = 'zeus'

# Find all scripts within the nested 'zeus' directory
scripts = glob.glob('zeus/*.py')

# Find all launch files
launch_files = glob.glob('launch/*.launch.py')

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(),
    data_files=[
        ('share/ament_index/resource_index/packages', ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name + '/launch', launch_files),
    ],
    
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='sebastian',
    maintainer_email='sebastian@todo.todo',
    description='TODO: Package description',
    license='Apache-2.0',
    entry_points={
        'console_scripts': [
            f'{os.path.splitext(os.path.basename(script))[0]} = zeus.{os.path.splitext(os.path.basename(script))[0]}:main'
            for script in scripts
        ],
    },
)