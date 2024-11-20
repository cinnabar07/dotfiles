import gdb

def get_base_address():
    try:
        # Get the base address of the main executable
        output = gdb.execute("info proc mappings", to_string=True)
        lines = output.split('\n')
        for line in lines:
            parts = line.split()
            if parts and parts[0].startswith('0x'):
                return int(parts[0], 16)
        raise ValueError("Base address not found in process mappings")
    except Exception as e:
        print(f"Error getting base address: {str(e)}")
        return None

def save_base_address(arg_name):
    base_addr = get_base_address()
    if base_addr is not None:
        # Save the base address to a GDB convenience variable
        gdb.execute(f"set ${arg_name} = {base_addr}")
        print(f"Base address 0x{base_addr:x} saved to ${arg_name}")
    else:
        print("Failed to save base address")

def check_and_set_base_address():
    try:
        # Try to access $base_address
        base_addr = gdb.parse_and_eval("$base_address")
        return int(base_addr)
    except gdb.error:
        # If $base_address is not set, set it
        base_addr = get_base_address()
        if base_addr is not None:
            gdb.execute(f"set $base_address = {base_addr}")
            return base_addr
        else:
            print("Failed to set base address")
            return None

class RTelescopeCommand(gdb.Command):
    def __init__(self):
        super(RTelescopeCommand, self).__init__("rtelescope", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        args = gdb.string_to_argv(arg)
        if len(args) != 1:
            print("Usage: rtelescope <rva>")
            return
        
        base_addr = check_and_set_base_address()
        if base_addr is None:
            print("Unable to get base address. Make sure the program is loaded.")
            return

        try:
            rva = int(args[0], 0)  # Convert input to int, auto-detect base
            absolute_addr = base_addr + rva
            
            # Execute pwndbg's telescope command
            gdb.execute(f"telescope {absolute_addr}")
        except ValueError:
            print(f"Invalid RVA: {args[0]}. Please provide a valid hexadecimal or decimal number.")
        except Exception as e:
            print(f"Error occurred: {str(e)}")

RTelescopeCommand()
