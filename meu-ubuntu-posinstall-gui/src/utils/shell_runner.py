import subprocess

def run_shell_script(script_path):
    """Executes the given shell script and returns the output."""
    try:
        result = subprocess.run(['bash', script_path], capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        return f"Error: {e.stderr}"