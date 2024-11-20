from pwn import *

exe = ELF("./bin", checksec=False)
libc = ELF("./libc.so.6", checksec=False)
ld = ELF("./ld.so", checksec=False)

context.binary = exe
context.terminal = ["tmux", "splitw", "-h", "-l 140"]
context.log_level = 'DEBUG'

ADDR = "chall.pwnable.tw"
PORT = 10304

# Helper
tb = lambda x: x if isinstance(x, bytes) else x.encode() if isinstance(x, str) else str(x).encode() 
s = lambda msg: r.send(tb(msg))
sa = lambda delim, msg: r.sendafter(delim, tb(msg))
sl = lambda msg: r.sendline(tb(msg))
sla = lambda delim, msg: r.sendlineafter(delim, tb(msg))
rl = lambda: r.recvline()
ru = lambda delim, drop=False: r.recvuntil(delim, drop=drop)
rcv = lambda num: r.recv(num)
pad8 = lambda msg: msg.ljust(8, b'\x00')
c = lambda i, base='A': chr(ord(base)+i)
cb = lambda i, base='A': c(i,base).encode()


def conn():
    if args.LOCAL:
        if args.PLT_DEBUG:
            r = gdb.debug([exe.path], GDB_SCRIPT)
        else:
            r = process([exe.path])
    else:
        r = remote(ADDR, PORT)

    return r


"""
 Exploit!

"""

GDB_SCRIPT = f"""
"""

r = conn()


r.interactive()
