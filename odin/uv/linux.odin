package uv
import "core:container/intrusive/list"
import "core:c"
import "core:sys/linux"
Mutex :: struct {
	__sig:    i64,
	__opaque: [56]u8,
}
// Passwd :: struct {
// 	pw_name:   cstring,
// 	// [PSX] user name 
// 	pw_passwd: cstring,
// 	// encrypted password 
// 	pw_uid:    uid_t,
// 	// [PSX] user uid 
// 	pw_gid:    gid_t,
// 	// [PSX] user gid 
// 	pw_change: libc.time_t,
// 	// password change time 
// 	pw_class:  cstring,
// 	// user access class 
// 	pw_gecos:  cstring,
// 	// Honeywell login info 
// 	pw_dir:    cstring,
// 	// [PSX] home directory 
// 	pw_shell:  cstring,
// 	// [PSX] default shell 
// 	pw_expire: libc.time_t,
// }

Cond :: struct {
	__sig:    i64,
	__opaque: [40]u8,
}
Key :: distinct u64

 ReqType :: enum c.int {
  UNKNOWN_REQ = 0,
  REQ_TYPE_PRIVATE,
  REQ_TYPE_MAX
} 



ActiveReqs :: union {
 rawptr,
   c.uint
} 

//  Queue :: struct  {
//  next: ^Queue,
// prev: ^Queue
// };
Queue :: list.Node
TimerHeap :: struct {                                                                    
   min: rawptr                                                                
   nelts: c.uint                                                    
}   
 Loop :: distinct rawptr


FsEventFlags :: enum i32 {
  /*
   * By default, if the fs event watcher is given a directory name, we will
   * watch for all events in that directory. This flags overrides this behavior
   * and makes fs_event report only changes to the directory entry itself. This
   * flag does not affect individual files watched.
   * This flag is currently not implemented yet on any backend.
   */
  FS_EVENT_WATCH_ENTRY = 1,

  /*
   * By default uv_fs_event will try to use a kernel interface such as inotify
   * or kqueue to detect events. This may not work on remote filesystems such
   * as NFS mounts. This flag makes fs_event fall back to calling stat() on a
   * regular interval.
   * This flag is currently not implemented yet on any backend.
   */
  FS_EVENT_STAT = 2,

  /*
   * By default, event watcher, when watching directory, is not registering
   * (is ignoring) changes in it's subdirectories.
   * This flag will override this behaviour on platforms that support it.
   */
   FS_EVENT_RECURSIVE = 4
};



 LoopOption :: enum i32 {
  LOOP_BLOCK_SIGNAL = 0,
  METRICS_IDLE_TIME,
  LOOP_USE_IO_URING_SQPOLL
} ;

RunMode:: enum c.int {
  RUN_DEFAULT = 0,
  RUN_ONCE,
  RUN_NOWAIT
} ;

Timespec :: struct {
 sec: c.long,
 nsec: c.long
} ;

Timespec64 :: struct {
 sec: c.int64_t
  tv_nsec: c.int32_t
} ;
ClockId ::enum {
 CLOCK_MONOTONIC,
 CLOCK_REALTIME
};


Timeval :: struct {
sec :c.long,
 tv_usec: c.long
} 

Timeval64 :: struct {
 sec: c.int64_t
 usec: c.int32_t
} ;

Stat ::struct {
  dev: c.uint64_t
 mode : c.uint64_t,
 nlink: c.uint64_t,
 id:  c.uint64_t,
 gid :  c.uint64_t,
 rdev:  c.uint64_t ,
 ino :c.uint64_t,
 
 size :c.uint64_t,
 blocksize :c.uint64_t,
 blocks :c.uint64_t,
 flags :c.uint64_t,
 gen :c.uint64_t,
 st_atim: Timespec,
 mtim : Timespec,
 ctim : Timespec,
 birthtim : Timespec,
} ;
 ThreadOptions::   struct  {
   flags: c.uint
  stack_size: c.size_t
  /* More fields may be added at any time. */
};
Thread :: distinct c.uint64_t


ThreadCreateFlags :: enum i32 {
  THREAD_NO_FLAGS = 0x00,
  THREAD_HAS_STACK_SIZE = 0x01
} ;


  FsType::enum i32 {
  FS_UNKNOWN = -1,
  FS_CUSTOM,
  FS_OPEN,
  FS_CLOSE,
  FS_READ,
  FS_WRITE,
  FS_SENDFILE,
  FS_STAT,
  FS_LSTAT,
  FS_FSTAT,
  FS_FTRUNCATE,
  FS_UTIME,
  FS_FUTIME,
  FS_ACCESS,
  FS_CHMOD,
  FS_FCHMOD,
  FS_FSYNC,
  FS_FDATASYNC,
  FS_UNLINK,
  FS_RMDIR,
  FS_MKDIR,
  FS_MKDTEMP,
  FS_RENAME,
  FS_SCANDIR,
  FS_LINK,
  FS_SYMLINK,
  FS_READLINK,
  FS_CHOWN,
  FS_FCHOWN,
  FS_REALPATH,
  FS_COPYFILE,
  FS_LCHOWN,
  FS_OPENDIR,
  FS_READDIR,
  FS_CLOSEDIR,
  FS_STATFS,
  FS_MKSTEMP,
  FS_LUTIME
};
 THREAD_PRIORITY:: enum i32 {
  THREAD_PRIORITY_HIGHEST = 2,
  THREAD_PRIORITY_ABOVE_NORMAL = 1,
  THREAD_PRIORITY_NORMAL = 0,
  THREAD_PRIORITY_BELOW_NORMAL = -1,
  THREAD_PRIORITY_LOWEST = -2,
};
 PRIORITY_LOW :: 19
PRIORITY_BELOW_NORMAL :: 10
 PRIORITY_NORMAL :: 0
 PRIORITY_ABOVE_NORMAL :: -7
 PRIORITY_HIGH :: -14
 PRIORITY_HIGHEST :: -20
EnvItem::struct  {
  name: cstring,
  value:cstring
};

 Membership  :: enum i32 {
  LEAVE_GROUP = 0,
  JOIN_GROUP
} ;
 Shutdown :: struct {
/* public */                                                                
 data : rawptr,
 
 /* read-only */                                                             
 type: ReqType,
 
 /* private */                                                               
 reserved: [6]rawptr,
   handle: Stream,
   cb: uv_shutdown_cb
};

 CpuTimes :: struct{
   user: c.uint64_t, /* milliseconds */
   nice : c.uint64_t, /* milliseconds */
   sys: c.uint64_t, /* milliseconds */
   idle: c.uint64_t, /* milliseconds */
   irq : c.uint64_t, /* milliseconds */
};
uv_async_s  :: distinct rawptr 
 uv_poll_event :: enum {
  READABLE = 1,
  WRITABLE = 2,
  DISCONNECT = 4,
  PRIORITIZED = 8
};
uv_poll_s :: distinct rawptr
/*
 * uv_getaddrinfo_t is a subclass of uv_req_t.
 *
 * Request object for uv_getaddrinfo.
 */
uv_getaddrinfo_s :: distinct rawptr
/*
 * uv_timer_t is a subclass of uv_handle_t.
 *
 * Used to get woken up at a specified time in the future.
 */
 Timer :: struct {
 
 /* public */                                                                
 data: rawptr,                                                             
 /* read-only */                                                             
  loop :Loop                                                           
 type: HandleType,                                                       
 /* private */                                                               
  close_cb: uv_close_cb,
  handle_queue: Queue,
 u: UHandle
  next_closing: ^Handle,                                                 
  flags: c.uint
  
 
  timer_cb: uv_timer_cb,                                                
  node: Node,                                                                  
   timeout: c.uint64_t,
   repeat: c.uint64_t,                                                            
   start_id: uint64_t
 
 }
 Node :: union {                                                                     
        [3]rawptr,
    Queue,                                                
  } ; 
 uv_prepare_s :: distinct rawptr
uv_check_s :: distinct rawptr
  
uv_idle_s :: distinct rawptr
/*
 * uv_getaddrinfo_t is a subclass of uv_req_t.
 *
 * Request object for uv_getaddrinfo.
 */
 GetAddrinfo :: struct {
 /* public */                                                                
  data:rawptr,
  /* read-only */                                                             
   type: ReqType,
  /* private */                                                               
   reserved: [6]rawptr,
   loop: Loop,
   work_req: Work,
   cb: uv_getaddrinfo_cb, 
   hints: ^Addrinfo,
   hostname: cstring,
   service: cstring,
   addrinfo: ^Addrinfo,
   retcode: c.int,
 }
/*
* uv_getnameinfo_t is a subclass of uv_req_t.
*
* Request object for uv_getnameinfo.
*/

  Udp :: struct {

  data: rawptr,
  loop_: Loop,
  type_: HandleType,
  close_cb: uv_close_cb,
  handle_queue: Queue,
  u:UHandle,
  next_closing: ^Handle ,
  flags: c.uint,
  send_queue_size: c.size_t,
  send_queue_count: c.size_t,
  alloc_cb: uv_alloc_cb,
  recv_cb: uv_udp_recv_cb,
  io_watcher: Io,
  write_queue: Queue,
  write_completed_queue: Queue,
}


Tcp :: struct {

data: rawptr,
loop_: Loop,
type_: HandleType,
close_cb: uv_close_cb,
handle_queue: Queue,
u:UHandle,
next_closing: ^Handle ,
flags: c.uint,
write_queue_size: c.size_t
alloc_cb: uv_alloc_cb,
recv_cb: uv_udp_recv_cb,
connect_req: ^Connect,
shutdown_req: ^Shutdown,
io_watcher: Io,
write_queue: Queue,
write_completed_queue: Queue,
connection_cb: uv_connection_cb,
delayed_error: c.int,
accepted_fd: c.int,
queued_fds: rawptr,
}
Sock_Addr :: struct #packed {
	sa_family: Address_Family,
	sa_data:   [14]u8,
}
Port :: u16 
 SaFamily :: u16
  InAddr :: u32
 InAddr :: struct {
      s_addr: InAddr,
 }
 SockaddrIn ::struct  {
      sin_family: SaFamily,
      sin_port: Port,
      sin_addr: InAddr,
      sin_zero: [8]c.uchar,
 }
 sockaddr_in6 :: struct {
	sin6_len:      u8,
	sin6_family:   sa_family_t,
	// [PSX] AF_INET6 (but a smaller size) 
	sin6_port:     u16be,
	// [PSX] port number 
	sin6_flowinfo: u32,
	// [PSX] IPv6 traffic class and flow information 
	sin6_addr:     in6_addr,
	// [PSX] IPv6 address 
	sin6_scope_id: u32,
 }
 in6_addr :: struct {
	using _: struct #raw_union {
		s6_addr:     [16]u8,
		// [PSX] big endian address 
		__u6_addr16: [8]u16,
		__u6_addr32: [4]u32,
	},
 }
Protocol :: enum i32 {
	IP   = 0, 
	ICMP = 1, 
	IPV6 = 41, 
	RAW  = 255, 
	TCP  = 6, 
	UDP  = 17, 
}
Sock_Option :: enum i32 {
	// Transmission of broadcast message is supported.
	BROADCAST = 32, 
	// Debugging information is being recorded.
	DEBUG     = 1, 
	// Bypass normal routing.
	DONTROUTE = 16, 
	// Socket error status.
	ERROR     = 4103, 
	// Connections are kept alive with periodic messages.
	KEEPALIVE = 8, 
	// Socket lingers on close.
	LINGER    = 4224, 
	// Out-of-band data is transmitted in line.
	OOBINLINE = 256, 
	// Receive buffer size.
	RCVBUF    = 4098, 
	// Receive low water mark.
	RCVLOWAT  = 4100, 
	// Receive timeout.
	RCVTIMEO  = 4102, 
	// Reuse of local addresses is supported.
	REUSEADDR = 4, 
	// Send buffer size.
	SNDBUF    = 4097, 
	// Send low water mark.
	SNDLOWAT  = 4099, 
	// Send timeout.
	SNDTIMEO  = 4101, 
	// Socket type.
	TYPE      = 4104, 
}
Sock :: enum i32 {
	// Datagram socket.
	DGRAM     = 2, 
	// Raw Protocol Interface.
	RAW       = 3, 
	// Sequenced-packet socket.
	SEQPACKET = 5, 
	// Byte-stream socket.
	STREAM    = 1, 
}

socklen_t :: distinct u32

Addrinfo_Flag_Bits :: enum i32 {
	// Socket address is intended for bind().
	PASSIVE     = 0, 
	// Request for canonical name.
	CANONNAME   = 1, 
	// Return numeric host address as name.
	NUMERICHOST = 2, 
	// Inhibit service name resolution.
	NUMERICSERV = 12, 
	// If no IPv6 addresses are found, query for IPv4 addresses and return them to the
	// caller as IPv4-mapped IPv6 addresses.
	V4MAPPED    = 11, 
	// Query for both IPv4 and IPv6 addresses.
	ALL         = 8, 
	// Query for IPv4 addresses only when an IPv4 address is configured; query for IPv6 addresses
	// only when an IPv6 address is configured.
	ADDRCONFIG  = 10, 
}
AF :: enum i32 {
	// Unspecified.
	UNSPEC = 0, 
	// Internet domain sockets for use with IPv4 addresses.
	INET   = 2, 
	// Internet domain sockets for use with IPv6 addresses.
	INET6  = 30, 
	// UNIX domain sockets.
	UNIX   = 1, 
}
 Addrinfo :: struct {
     ai_flags: bit_set[Addrinfo_Flag_Bits; i32],
     ai_family: AF,
     ai_socktype: Sock,
     ai_protocol: Protocol,
     ai_addrlen: socklen_t,
     ai_addr: ^Sock_Addr,
     ai_canonname: cstring,
     ai_next: ^Addrinfo,
}

/* uv_spawn() options. */
 StdioFlags:: enum i32 {
  IGNORE         = 0x00,
  CREATE_PIPE    = 0x01,
  INHERIT_FD     = 0x02,
  INHERIT_STREAM = 0x04,

  /*
   * When CREATE_PIPE is specified, READABLE_PIPE and WRITABLE_PIPE
   * determine the direction of flow, from the child process' perspective. Both
   * flags may be specified to create a duplex data stream.
   */
  READABLE_PIPE  = 0x10,
  WRITABLE_PIPE  = 0x20,

  /*
   * When CREATE_PIPE is specified, specifying NONBLOCK_PIPE opens the
   * handle in non-blocking mode in the child. This may cause loss of data,
   * if the child is not designed to handle to encounter this mode,
   * but can also be significantly more efficient.
   */
  NONBLOCK_PIPE  = 0x40,
  OVERLAPPED_PIPE = 0x40 /* old name, for compatibility */
} ;
Handle :: distinct rawptr
Stream :: distinct rawptr
StdioContainerData ::#raw_union union {
^Stream,
 int
}
StdioContainer  ::struct {
  flags: StdioFlags

 data: StdioContainerData
} ;

 Pipe :: struct {
/* public */                                                                
 data: rawptr,                                                                
 /* read-only */                                                             
  loop: Loop,
 type: HandleType,
 /* private */                                                               
  close_cb: uv_close_cb,                                                      
  handle_queue: Queue,
 u:    UHandle,               
 /* number of bytes queued for writing */                                    
  write_queue_size: c.size_t,
  alloc_cb: uv_alloc_cb  ,                                               
  read_cb: uv_read_cb
 connect_req: ^Connect,
  shutdown_req: ^Shutdown,
   io_watcher: Io,                                                      
   write_queue: Queue          ,                                     
   write_completed_queue: Queue,
   connection_cb: uv_connection_cb                                         
   delayed_error: i32,                                                        
   accepted_fd: i32,
   queued_fds: rawptr,
 /* private */     
  ipc: i32, /* non-zero if this pipe is used for passing handles */
  pipe_fname: cstring,
};
 ProcessOptions :: struct  {
   exit_cb: uv_exit_cb, /* Called after the process exits. */
   file: cstring,   /* Path to program to execute. */
  /*
   * Command line arguments. args[0] should be the path to the program. On
   * Windows this uses CreateProcess which concatenates the arguments into a
   * string this can cause some strange errors. See the note at
   * windows_verbatim_arguments.
   */
  args: [^]cstring,
  /*
   * This will be set as the environ variable in the subprocess. If this is
   * NULL then the parents environ will be used.
   */
  env:  [^]cstring,
  /*
   * If non-null this represents a directory the subprocess should execute
   * in. Stands for current working directory.
   */
 cwd: cstring,
  /*
   * Various flags that control how uv_spawn() behaves. See the definition of
   * `enum uv_process_flags` below.
   */
   flags: c.uint,
  /*
   * The `stdio` field points to an array of uv_stdio_container_t structs that
   * describe the file descriptors that will be made available to the child
   * process. The convention is that stdio[0] points to stdin, fd 1 is used for
   * stdout, and fd 2 is stderr.
   *
   * Note that on windows file descriptors greater than 2 are available to the
   * child process only if the child processes uses the MSVCRT runtime.
   */
stdio_count: c.int,
  uv_stdio_container_t* stdio;
  /*
   * Libuv can change the child process' user/group id. This happens only when
   * the appropriate bits are set in the flags fields. This is not supported on
   * windows; uv_spawn() will fail and set the error to ENOTSUP.
   */
  uv_uid_t uid;
  uv_gid_t gid;
} ;
/*
 * These are the flags that can be used for the uv_process_options.flags field.
 */ ProcessFlags :: enum i32 {
  /*
   * Set the child process' user id. The user id is supplied in the `uid` field
   * of the options struct. This does not work on windows; setting this flag
   * will cause uv_spawn() to fail.
   */
  PROCESS_SETUID = (1 << 0),
  /*
   * Set the child process' group id. The user id is supplied in the `gid`
   * field of the options struct. This does not work on windows; setting this
   * flag will cause uv_spawn() to fail.
   */
  PROCESS_SETGID = (1 << 1),
  /*
   * Do not wrap any arguments in quotes, or perform any other escaping, when
   * converting the argument list into a command line string. This option is
   * only meaningful on Windows systems. On Unix it is silently ignored.
   */
  PROCESS_WINDOWS_VERBATIM_ARGUMENTS = (1 << 2),
  /*
   * Spawn the child process in a detached state - this will make it a process
   * group leader, and will effectively enable the child to keep running after
   * the parent exits.  Note that the child process will still keep the
   * parent's event loop alive unless the parent process calls uv_unref() on
   * the child's process handle.
   */
  PROCESS_DETACHED = (1 << 3),
  /*
   * Hide the subprocess window that would normally be created. This option is
   * only meaningful on Windows systems. On Unix it is silently ignored.
   */
  PROCESS_WINDOWS_HIDE = (1 << 4),
  /*
   * Hide the subprocess console window that would normally be created. This
   * option is only meaningful on Windows systems. On Unix it is silently
   * ignored.
   */
  PROCESS_WINDOWS_HIDE_CONSOLE = (1 << 5),
  /*
   * Hide the subprocess GUI window that would normally be created. This
   * option is only meaningful on Windows systems. On Unix it is silently
   * ignored.
   */
  PROCESS_WINDOWS_HIDE_GUI = (1 << 6),
  /*
   * On Windows, if the path to the program to execute, specified in
   * uv_process_options_t's file field, has a directory component,
   * search for the exact file name before trying variants with
   * extensions like '.exe' or '.cmd'.
   */
  PROCESS_WINDOWS_FILE_PATH_EXACT_NAME = (1 << 7)
}


Dir :: distinct rawptr
File :: distinct c.int
OsSock :: distinct i32
OsFd  :: distinct i32
Pid  :: distinct i32
Process :: distinct rawptr
CpuInfo ::struct {
  model: cstring,
  speed: c.int,
   cpu_times: CpuTimes
};

struct uv_interface_address_s {
   name: cstring,
 phys_addr: [6]u8,
  s_internal: c.int
  union {
    struct sockaddr_in address4;
    struct sockaddr_in6 address6;
  } address;
  union {
    struct sockaddr_in netmask4;
    struct sockaddr_in6 netmask6;
  } netmask;
};

Passwd ::struct  {
   username: cstring,
   uid: c.ulong,
  gid: c.ulong,
   shell: cstring,
   homedir:cstring
};

Group :: struct {
  groupname: cstring,
  gid: c.ulong,
  members: [^]cstring
};

/* Abstract base class of all requests. */
Req :: struct {

/* public */                                                                
data : rawptr,

/* read-only */                                                             
type: ReqType,

/* private */                                                               
reserved: [6]rawptr

}
uv_work_cb :: proc(work: ^Work) ;

uv_work_done_cb :: proc(work: ^Work, status: i32) {;
Work :: struct{
  work: uv_work_cb,
  done: uv_work_done_cb,
  loop: Loop,
  wq: Queue,
};
 DirentType::enum i32 {
  DIRENT_UNKNOWN,
  DIRENT_FILE,
  DIRENT_DIR,
  DIRENT_LINK,
  DIRENT_FIFO,
  DIRENT_SOCKET,
  DIRENT_CHAR,
  DIRENT_BLOCK
} ;
 Poll:: struct {
/* public */                                                                
data: rawptr,                                                             
/* read-only */                                                             
 loop :Loop                                                           
type: HandleType,                                                       
/* private */                                                               
 close_cb: uv_close_cb,
 handle_queue: Queue,
u: UHandle
 next_closing: ^Handle,                                                 
 flags: c.uint,
 poll_cb: uv_poll_cb,
  io_watcher:  Io
}
 DirEntry ::struct {
 name :cstring,
   type : DirentType,
 
};

 Utsname:: struct{
   sysname: [256]u8,
  release: [256]u8,
  version: [256]u8,
   machine: [256]u8,
  /* This struct does not contain the nodename and domainname fields present in
     the utsname type. domainname is a GNU extension. Both fields are referred
     to as meaningless in the docs. */
};
Fs :: distinct rawptr
StatFs :: struct {
   f_type: c.uint64_t,
   f_bsize : c.uint64_t,
   f_blocks : c.uint64_t,
   f_bfree : c.uint64_t,
   f_bavail : c.uint64_t,
   f_files : c.uint64_t,
   f_ffree : c.uint64_t,
  f_spare: [4]c.uint64_t,
};
UHandle :: #raw_union union  {
    i32,
 [4]rawptr

}
RUsage:: struct {
    ru_utime: Timeval, /* user CPU time used */
    ru_stime :Timeval, /* system CPU time used */
   uint64_t ru_maxrss;    /* maximum resident set size */
   uint64_t ru_ixrss;     /* integral shared memory size */
   uint64_t ru_idrss;     /* integral unshared data size */
   uint64_t ru_isrss;     /* integral unshared stack size */
   uint64_t ru_minflt;    /* page reclaims (soft page faults) */
   uint64_t ru_majflt;    /* page faults (hard page faults) */
   uint64_t ru_nswap;     /* swaps */
   uint64_t ru_inblock;   /* block input operations */
   uint64_t ru_oublock;   /* block output operations */
   uint64_t ru_msgsnd;    /* IPC messages sent */
   uint64_t ru_msgrcv;    /* IPC messages received */
   uint64_t ru_nsignals;  /* signals received */
   uint64_t ru_nvcsw;     /* voluntary context switches */
   uint64_t ru_nivcsw;    /* involuntary context switches */
} ;

Async :: struct {
/* public */                                                                
data: rawptr,
/* read-only */                                                             
loop: Loop,
type: HandleType,                                                  
/* private */                                                               
 close_cb: uv_close_cb,                                                    
handle_queue: Queue
 u: UHandle,

 next_closing: ^Handle
 flags: c.uint                                                  

 async_cb: uv_async_cb
 queue: Queue,
 pending: c.int                                                              
}

Handle :: struct {
/* public */                                                                
data: rawptr,                                                             
/* read-only */                                                             
 loop :Loop                                                           
type: HandleType,                                                       
/* private */                                                               
 close_cb: uv_close_cb,
 handle_queue: Queue,
u: UHandle
 next_closing: ^Handle,                                                 
 flags: c.uint
 
}


/* RB_ENTRY(uv_signal_s) tree_entry; */                                     
 TreeEntry ::   struct {                                                                    
 rbe_left: ^Signal,
  rbe_right:     ^Signal,                                      
  rbe_parent: ^Signal,                                        
   rbe_color: i32                                                            
} ;                                                               
Signal :: struct  {


/* public */                                                                
 data: rawptr,
/* read-only */                                                             
loop: Handle,                                                            
 type: HandleType,
/* private */                                                               
 close_cb: uv_close_cb,                                                    
 handle_queue: Queue,                                        
u: UHandle,
next_closing: ^Handle,
  flags: c.uint,
/* private */
   signal_cb: uv_signal_cb,
  signum: i32,
  tree_entry: TreeEntry,
  /* Use two counters here so we don have to fiddle with atomics. */          
  caught_signals: u32,
 dispatched_signals: u32
};

 FsEvent :: enum i32 {
  UV_RENAME = 1,
  UV_CHANGE = 2
};
 FsEvent ::struct  {

  
  
  /* public */                                                                
   data: rawptr,
  /* read-only */                                                             
  loop: Handle,                                                            
   type: HandleType,
  /* private */                                                               
   close_cb: uv_close_cb,                                                    
   handle_queue: Queue     ,                                   
  u: UHandle,
  next_closing: ^Handle,
    flags: c.uint,
  /* private */
   path: cstring,
                                                        
       cb: uv_fs_event_cb,                                                   
   watchers :Queue                                                  
   wd: i32                                                                   
};


Connect :: struct {
 data: rawptr,
 type_: ReqType,
 reserved: [6]rawptr,
 cb: uv_connect_cb,
 handle: ^Stream
 queue: Queue,

}
Stream :: struct {
/* public */                                                                
 data: rawptr,
/* read-only */                                                             
loop: Handle,                                                            
 type: HandleType,
/* private */                                                               
 close_cb: uv_close_cb,                                                    
 handle_queue: Queue     ,                                   
u: UHandle,
next_closing: ^Handle,
  flags: c.uint,
  /* number of bytes queued for writing */                                    
   write_queue_size: c.size_t,                                                    
   alloc_cb: uv_alloc_cb,                                                 
   read_cb: uv_read_cb,                                                       
  /* private */                                                               
  connect_req: ^Connect,
  shutdown_req: ^Shutdown,                                       
   io_watcher: Io,
  write_queue: Queue,                                              
  write_completed_queue: Queue,
   connection_cb: uv_connection_cb,                                      
  elayed_error: c.int,
  accepted_fd: c.int,                                                        
  queued_fds: rawptr,
  }
  
Io:: struct {
     cb: uv_io_cb,
     pending_queue: Queue,
     watcher_queue: Queue,
     pevents :u32, /* Pending event mask i.e. mask at next tick. */
     events: u32, /* Current event mask. */
     fd: u32,
    
  };