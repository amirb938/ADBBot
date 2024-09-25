import subprocess

def get_memory_usage(package_name):
    # Run the adb shell dumpsys meminfo command
    result = subprocess.run(['adb', 'shell', 'dumpsys', 'meminfo', package_name], stdout=subprocess.PIPE)
    output = result.stdout.decode('utf-8')

    # Initialize memory usage variables
    total_pss = 0
    private_dirty = 0

    # Flag to start reading memory info
    memory_info_section = False

    # Parse the output
    for line in output.splitlines():
        # Check if the memory info section starts
        if 'TOTAL' in line:
            memory_info_section = True
        
        # Process lines in the memory info section
        if memory_info_section:
            # Split line into parts and try to parse relevant information
            parts = line.split()
            if len(parts) >= 5:
                try:
                    if parts[0] == 'Pss':
                        total_pss += int(parts[1])
                    elif parts[0] == 'Private':
                        private_dirty += int(parts[2])
                except ValueError:
                    # Skip lines that can't be converted to integer
                    continue

    return total_pss, private_dirty

def save_to_file(package_name, file_path):
    # Get memory usage data
    total_pss, private_dirty = get_memory_usage(package_name)
    
    # Prepare the content to save
    content = f"Memory usage for package: {package_name}\n"
    content += f"Total PSS: {total_pss} KB\n"
    content += f"Private Dirty: {private_dirty} KB\n"

    # Save the content to the file
    with open(file_path, 'w') as file:
        file.write(content)

# Example usage
package_name = "ir.huma.humastore"  # Replace with your package name
file_path = "memory_usage.txt"  # Replace with your desired file path
save_to_file(package_name, file_path)
print(f"Memory usage data saved to {file_path}")
