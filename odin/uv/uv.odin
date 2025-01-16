package uv
import "core:c"

foreign import libuv {
			"libuv.a",
}

signal_cb :: proc (handle: ^Signal, signum: c.int) ---


io_cb :: proc(loop: Loop,w: ^UvIo, events :c.uint) ---


}
uv_malloc_func :: proc(size: c.size_t) ---
uv_realloc_func :: proc(ptr: rawptr,size: c.size_t) ---
uv_calloc_func ::proc( count: c.size_t, size:c.size_t) ---
uv_free_func :: proc(ptr:rawptr) ---
typedef void (*uv_fs_event_cb)(handle: ^FsEvent,
                               const char* filename,
                               int events,
                               int status);


                               
                               typedef void (*uv_alloc_cb)(uv_handle_t* handle,
                                                           size_t suggested_size,
                                                           uv_buf_t* buf);
                               typedef void (*uv_read_cb)(uv_stream_t* stream,
                                                          ssize_t nread,
                                                          const uv_buf_t* buf);
                               typedef void (*uv_write_cb)(uv_write_t* req, int status);
                               typedef void (*uv_connect_cb)(uv_connect_t* req, int status);
                               typedef void (*uv_shutdown_cb)(uv_shutdown_t* req, int status);
                               typedef void (*uv_connection_cb)(uv_stream_t* server, int status);
                               typedef void (*uv_close_cb)(uv_handle_t* handle);
                               typedef void (*uv_poll_cb)( handle: Poll, int status, int events);
                               typedef void (*uv_timer_cb)(handle: Timer);
                               typedef void (*uv_async_cb)(uv_async_t* handle);
                               typedef void (*uv_prepare_cb)(uv_prepare_t* handle);
                               typedef void (*uv_check_cb)(uv_check_t* handle);
                               typedef void (*uv_idle_cb)(uv_idle_t* handle);
                               uv_exit_cb ::proc ( options: ^ProcessOptions, int64_t exit_status, int term_signal) ---
                               typedef void (*uv_walk_cb)(uv_handle_t* handle, arg: rawptr);
                               typedef void (*uv_fs_cb)(uv_fs_t* req);
                               typedef void (*uv_work_cb)(uv_work_t* req);
                               typedef void (*uv_after_work_cb)(uv_work_t* req, int status);
                               typedef void (*uv_getaddrinfo_cb)(uv_getaddrinfo_t* req,
                                                                 int status,
                                                                 struct addrinfo* res);
                               typedef void (*uv_getnameinfo_cb)(uv_getnameinfo_t* req,
                                                                 int status,
                                                                 const char* hostname,
                                                                 const char* service);
                               typedef void (*uv_random_cb)(uv_random_t* req,
                                                            int status,
                                                            void* buf,
                                                            size_t buflen);
foreign libuv {
    
uv_library_shutdown ::proc(v) ---

UV_EXTERN int uv_replace_allocator :: proc(uv_malloc_func malloc_func,
                                   uv_realloc_func realloc_func,
                                   uv_calloc_func calloc_func,
                                   uv_free_func free_func) -> c.int ---
       @(link_name="uv_default_loop")    default_loop ::proc () -> Loop ---
      @(link_name="uv_loop_init")   loop_init ::proc(loop :Loop) -> c.int ---
     @(link_name="uv_loop_close") loop_close ::proc (loop: Loop) -> c.int ---
/*
 * NOTE:
 *  This function is DEPRECATED, users should
 *  allocate the loop manually and use uv_loop_init instead.
 */
 @(link_name="uv_loop_new") loop_new ::proc () -> Loop ---
/*
 * NOTE:
 *  This function is DEPRECATED. Users should use
 *  uv_loop_close and free the memory manually instead.
 */
     @(link_name="uv_loop_delete") loop_delete :: proc(loop: Loop)  ---
     @(link_name="uv_loop_size") loop_size ::proc() -> c.size_t ---
     @(link_name="uv_loop_alive") loop_alive::proc (loop: Loop) -> c.int ---
     @(link_name="uv_loop_configure") loop_configure :: proc (loop: Loop, option: LoopOption) -> c.int ---
     @(link_name="uv_loop_fork") uv_loop_fork :: proc(loop: Loop)-> c.int ---

     @(link_name="uv_run") run  ::proc(loop: Loop,  mode :RunMode)-> c.int ---
      @(link_name="uv_stop")  stop :: proc(loop : Loop) ---

     @(link_name="uv_ref")ref ::proc(handle :Handle) ---
 @(link_name="uv_ref") unref :: proc(handle: Handle) ---    
     @(link_name="uv_has_ref")   as_ref :: proc(handle :Handle) -> c.int ---

 @(link_name="uv_update_time") update_time :: proc(loop: Loop) ---
  @(link_name="uv_now")  now :: proc(loop: Loop)-> c.uint64_t ---

  @(link_name="uv_backend_fd")  backend_fd ::proc (loop: Loop) -> c.int ---
  @(link_name="uv_backend_timeout")   uv_backend_timeout :: proc(loop: Loop) -> c.int ---
    @(link_name="uv_version") version ::proc() -> c.uint ---
    @(link_name="uv_version_string") version_string ::proc() -> cstring ---
    // @(link_name="uv_library_shutdown") library_shutdown :: proc() ---
    // @(link_name="uv_library_shutdown") library_shutdown :: proc() -> Loop ---
    
      @(link_name="uv_loop_get_data") loop_get_data :: proc( loop: Loop) -> rawptr ---
     @(link_name="uv_loop_set_data") loop_set_data :: proc(loopY: Loop,  data: rawptr);
    @(link_name="uv_signal_init")  signal_init :: proc(loop: Loop,handle : ^Signal ) -> c.int ---
      @(link_name="uv_signal_start") signal_start :: proc( handle :^Signal ,
                                   signal_cb: usignal_cb,
                                  signum: c.int) -> c.int ---
      @(link_name="uv_signal_start_oneshot") signal_start_oneshot:: proc( handle: ^Signal,
                                           signal_cb: signal_cb,
                                          signum: c.int) -> c.int ---
    @(link_name="uv_signal_stop")   signal_stop :: proc(handle: ^Signal) -> c.int --- 
    
    @(link_name="uv_loadavg")   loadavg :: proc( avg: [3]c.double) ---
    
    @(link_name="uv_if_indextoname") if_indextoname:: proc(ifindex: c.uint,
                                    buffer: cstring,
                                     size: c.size_t) -> c.int ---
  @(link_name="uv_if_indextoiid") if_indextoiid ::proc(ifindex: c.uint,
                                   buffer: cstring,
                                    size: c.size_t) -> c.int ---
    
      @(link_name="uv_exepath") exepath::proc( buffer: cstring, size :c.size_t) -> c.int---
    
     @(link_name="uv_cwd") cwd :: proc( buffer: string, size: c.size_t) -> c.int ---
    
     @(link_name="uv_chdir") chdir ::proc(dir: cstring) -> c.int ---
    
   @(link_name="uv_get_free_memory")  get_free_memory::proc()-> c.uint64_t ---
   @(link_name="uv_get_total_memory") get_total_memory::proc() -> c.uint64_t ---
    @(link_name="uv_get_constrained_memory")  get_constrained_memory ::proc() -> c.uint64_t ---
     @(link_name="uv_get_available_memory") get_available_memory:: proc() -> c.uint64_t ---
    
     @(link_name="uv_clock_gettime") clock_gettime :: proc(clock_id: ClockId, ts: ^Timespec)-> c.int ---
      @(link_name="uv_hrtime") hrtime ::proc() -> c.uint64_t ---
     @(link_name="uv_sleep")  sleep ::proc( msec: c.uint) ---
   
    
    //  int uv_mutex_init(uv_mutex_t* handle);
    //  int uv_mutex_init_recursive(uv_mutex_t* handle);
    //  void uv_mutex_destroy(uv_mutex_t* handle);
    //  void uv_mutex_lock(uv_mutex_t* handle);
    //  int uv_mutex_trylock(uv_mutex_t* handle);
    //  void uv_mutex_unlock(uv_mutex_t* handle);
    
    //  int uv_rwlock_init(uv_rwlock_t* rwlock);
    //  void uv_rwlock_destroy(uv_rwlock_t* rwlock);
    //  void uv_rwlock_rdlock(uv_rwlock_t* rwlock);
    //  int uv_rwlock_tryrdlock(uv_rwlock_t* rwlock);
    //  void uv_rwlock_rdunlock(uv_rwlock_t* rwlock);
    //  void uv_rwlock_wrlock(uv_rwlock_t* rwlock);
    //  int uv_rwlock_trywrlock(uv_rwlock_t* rwlock);
    //  void uv_rwlock_wrunlock(uv_rwlock_t* rwlock);
    
    //  int uv_sem_init(uv_sem_t* sem, unsigned int value);
    //  void uv_sem_destroy(uv_sem_t* sem);
    //  void uv_sem_post(uv_sem_t* sem);
    //  void uv_sem_wait(uv_sem_t* sem);
    //  int uv_sem_trywait(uv_sem_t* sem);
    
    //  int uv_cond_init(uv_cond_t* cond);
    //  void uv_cond_destroy(uv_cond_t* cond);
    //  void uv_cond_signal(uv_cond_t* cond);
    //  void uv_cond_broadcast(uv_cond_t* cond);
    
    //  int uv_barrier_init(uv_barrier_t* barrier, unsigned int count);
    //  void uv_barrier_destroy(uv_barrier_t* barrier);
    //  int uv_barrier_wait(uv_barrier_t* barrier);
    
    //  void uv_cond_wait(uv_cond_t* cond, uv_mutex_t* mutex);
    //  int uv_cond_timedwait(uv_cond_t* cond,
    //                                 uv_mutex_t* mutex,
    //                                 uint64_t timeout);
    
    //  void uv_once(uv_once_t* guard, void (*callback)(void));
    
    //  int uv_key_create(uv_key_t* key);
    //  void uv_key_delete(uv_key_t* key);
    //  void* uv_key_get(uv_key_t* key);
    //  void uv_key_set(uv_key_t* key, void* value);
    
    //  int uv_gettimeofday(uv_timeval64_t* tv);
    
    UV_EXTERN int uv_async_init(loop: Loop,
                                async: Async,
                                uv_async_cb async_cb);
    UV_EXTERN int uv_async_send(async: Async);

    UV_EXTERN int uv_timer_init(loop: Loop, handle: Timer);
    UV_EXTERN int uv_timer_start(handle: Timer,
                                 uv_timer_cb cb,
                                 uint64_t timeout,
                                 uint64_t repeat);
    UV_EXTERN int uv_timer_stop(handle: Timer);
    UV_EXTERN int uv_timer_again(handle: Timer);
    UV_EXTERN void uv_timer_set_repeat(handle: Timer, uint64_t repeat);
    UV_EXTERN uint64_t uv_timer_get_repeat(const handle: Timer);
    UV_EXTERN uint64_t uv_timer_get_due_in(const handle: Timer);
    
    UV_EXTERN int uv_getaddrinfo(loop: Loop,
                                 uv_getaddrinfo_t* req,
                                 uv_getaddrinfo_cb getaddrinfo_cb,
                                 const char* node,
                                 const char* service,
                                 const struct addrinfo* hints);
    UV_EXTERN void uv_freeaddrinfo(struct addrinfo* ai);

    UV_EXTERN int uv_getnameinfo(loop: Loop,
                                 uv_getnameinfo_t* req,
                                 uv_getnameinfo_cb getnameinfo_cb,
                                 const struct sockaddr* addr,
                                 flags:c.int);
    UV_EXTERN int uv_spawn(loop: Loop,
                          handle: Process,
                           const uv_process_options_t* options);
    UV_EXTERN int uv_process_kill(uv_process_t*, int signum);
    UV_EXTERN int uv_kill(int pid, int signum);
    UV_EXTERN uv_pid_t uv_process_get_pid(const uv_process_t*);

     int uv_getrusage(rusage: RUsage);
     UV_EXTERN int uv_queue_work(loop: Loop,
                                 uv_work_t* req,
                                 uv_work_cb work_cb,
                                 uv_after_work_cb after_work_cb);
                                 UV_EXTERN size_t uv_req_size(uv_req_type type);
                                 UV_EXTERN void* uv_req_get_data(const uv_req_t* req);
                                 UV_EXTERN void uv_req_set_data(uv_req_t* req, void* data);
                                 UV_EXTERN uv_req_type uv_req_get_type(const uv_req_t* req);
                                 UV_EXTERN const char* uv_req_type_name(uv_req_type type);
     UV_EXTERN int uv_cancel(uv_req_t* req) -> i32 --- 
     int uv_os_homedir(buffer: cstring, size: c.size_t);
     int uv_os_tmpdir(buffer: cstring, size: c.size_t);
     int uv_os_get_passwd(pwd: ^Passwd);
     void uv_os_free_passwd(pwd: ^Passwd);
     int uv_os_get_passwd2(pwd: ^Passwd, uv_uid_t uid);
     int uv_os_get_group(uv_group_t* grp, uv_uid_t gid);
     void uv_os_free_group(uv_group_t* grp);
     uv_pid_t uv_os_getpid(void);
     uv_pid_t uv_os_getppid(void);
     int uv_os_getpriority(uv_pid_t pid, priority: ^i32);
     int uv_os_setpriority(uv_pid_t pid, priority: c.int);
    
     UV_EXTERN int uv_poll_init(loop: Loop,  handle: Poll, int fd);
     UV_EXTERN int uv_poll_init_socket(loop: Loop,
                                       handle: Poll,
                                       uv_os_sock_t socket);
     UV_EXTERN int uv_poll_start( handle: Poll, int events, uv_poll_cb cb);
     UV_EXTERN int uv_poll_stop( handle: Poll,);
     UV_EXTERN int uv_prepare_init(loop: Loop, uv_prepare_t* prepare);
     UV_EXTERN int uv_prepare_start(uv_prepare_t* prepare, uv_prepare_cb cb);
     UV_EXTERN int uv_prepare_stop(uv_prepare_t* prepare);
     UV_EXTERN int uv_check_init(loop: Loop, uv_check_t* check);
     UV_EXTERN int uv_check_start(uv_check_t* check, uv_check_cb cb);
     UV_EXTERN int uv_check_stop(uv_check_t* check);

     int uv_thread_getpriority(uv_thread_t tid, priority: ^i32);
     int uv_thread_setpriority(uv_thread_t tid, priority: c.int);
    
     UV_EXTERN int uv_idle_init(loop: Loop, uv_idle_t* idle);
     UV_EXTERN int uv_idle_start(uv_idle_t* idle, uv_idle_cb cb);
     UV_EXTERN int uv_idle_stop(uv_idle_t* idle);
     unsigned int uv_available_parallelism(void);
     int uv_cpu_info(uv_cpu_info_t** cpu_infos, int* count);
     void uv_free_cpu_info(uv_cpu_info_t* cpu_infos, int count);
      uv_cpumask_size() -> c.int ---
    
     int uv_interface_addresses(uv_interface_address_t** addresses,
                                         int* count);
     void uv_free_interface_addresses(uv_interface_address_t* addresses,
                                               int count);
     int uv_os_gethostname(buffer: cstring, size: c.size_t);
    
     int uv_os_environ(uv_env_item_t** envitems, int* count);
     void uv_os_free_environ(uv_env_item_t* envitems, int count);
     int uv_os_getenv(name: cstring, buffer: cstring, size: c.size_t);
     int uv_os_setenv(name: cstring,  value: cstring);
     int uv_os_unsetenv(name: cstring);
     int uv_os_uname(uv_utsname_t* buffer);
     int uv_metrics_info(loop: Loop, uv_metrics_t* metrics);
     uint64_t uv_metrics_idle_time(loop: Loop);
     uv_fs_type uv_fs_get_type(const uv_fs_t*);
     ssize_t uv_fs_get_result(const uv_fs_t*);
     int uv_fs_get_system_error(const uv_fs_t*);
     void* uv_fs_get_ptr(const uv_fs_t*);
     const char* uv_fs_get_path(const uv_fs_t*);
     uv_stat_t* uv_fs_get_statbuf(uv_fs_t*);
    
     void uv_fs_req_cleanup(uv_fs_t* req);
     int uv_fs_close(loop: Loop,
                             req: Fs,
                              file: File,
                              cb: uv_fs_cb);
     int uv_fs_open(loop: Loop,
                            req: Fs,
                             path: cstring,
                             flags: c.int
                             int mode,
                             cb: uv_fs_cb);
     int uv_fs_read(loop: Loop,
                            req: Fs,
                             file: File,
                             const uv_buf_t bufs[],
                             unsigned int nbufs,
                             offset: c.int64_t,
                             cb: uv_fs_cb);
     int uv_fs_unlink(loop: Loop,
                              req: Fs,
                               path: cstring,
                               cb: uv_fs_cb);
     int uv_fs_write(loop: Loop,
                             req: Fs,
                              file: File,
                              const uv_buf_t bufs[],
                              unsigned int nbufs,
                              offset: c.int64_t,
                              cb: uv_fs_cb);
    /*
     int uv_fs_copyfile(loop: Loop,
                                req: Fs,
                                 path: cstring,
                                 new_path: cstring,
                                 flags: c.int
                                 cb: uv_fs_cb);
     int uv_fs_mkdir(loop: Loop,
                             req: Fs,
                              path: cstring,
                              int mode,
                              cb: uv_fs_cb);
     int uv_fs_mkdtemp(loop: Loop,
                               req: Fs,
                                const char* tpl,
                                cb: uv_fs_cb);
     int uv_fs_mkstemp(loop: Loop,
                               req: Fs,
                                const char* tpl,
                                cb: uv_fs_cb);
     int uv_fs_rmdir(loop: Loop,
                             req: Fs,
                              path: cstring,
                              cb: uv_fs_cb);
     int uv_fs_scandir(loop: Loop,
                               req: Fs,
                                path: cstring,
                                flags: c.int
                                cb: uv_fs_cb);
     int uv_fs_scandir_next(uv_fs_t* req,
                                     uv_dirent_t* ent);
                                     
            
                                     EXTERN char** uv_setup_args(int argc, char** argv);
                                     UV_EXTERN int uv_get_process_title(buffer: cstring size_t size);
                                     UV_EXTERN int uv_set_process_title(const char* title);
                                     UV_EXTERN int uv_resident_set_memory(size_t* rss);
                                     UV_EXTERN int uv_uptime(double* uptime);
                                     UV_EXTERN uv_os_fd_t uv_get_osfhandle(int fd);
                                     UV_EXTERN int uv_open_osfhandle(uv_os_fd_t os_fd);
     int uv_fs_opendir(loop: Loop,
                               req: Fs,
                                path: cstring,
                                cb: uv_fs_cb);
     int uv_fs_readdir(loop: Loop,
                               req: Fs,
                                dir :Dir,
                                cb: uv_fs_cb);
     int uv_fs_closedir(loop: Loop,
                                req: Fs,
                                 dir :Dir,
                                 cb: uv_fs_cb);
     int uv_fs_stat(loop: Loop,
                            req: Fs,
                             path: cstring,
                             cb: uv_fs_cb);
     int uv_fs_fstat(loop: Loop,
                             req: Fs,
                              file: File,
                              cb: uv_fs_cb);
     int uv_fs_rename(loop: Loop,
                              req: Fs,
                               path: cstring,
                               new_path: cstring,
                               cb: uv_fs_cb);
     int uv_fs_fsync(loop: Loop,
                             req: Fs,
                              file: File,
                              cb: uv_fs_cb);
     int uv_fs_fdatasync(loop: Loop,
                                 req: Fs,
                                  file: File,
                                  cb: uv_fs_cb);
     int uv_fs_ftruncate(loop: Loop,
                                 req: Fs,
                                  file: File,
                                  offset: c.int64_t,
                                  cb: uv_fs_cb);
     int uv_fs_sendfile(loop: Loop,
                                req: Fs,
                                 out_fd: File,
                                 in_fd: File,
                                 int64_t in_offset,
                                 length: c.size_t,
                                 cb: uv_fs_cb);
     int uv_fs_access(loop: Loop,
                              req: Fs,
                               path: cstring,
                               int mode,
                               cb: uv_fs_cb);
     int uv_fs_chmod(loop: Loop,
                             req: Fs,
                              path: cstring,
                              int mode,
                              cb: uv_fs_cb);
     int uv_fs_utime(loop: Loop,
                             req: Fs,
                              path: cstring,
                              double atime,
                              double mtime,
                              cb: uv_fs_cb);
     int uv_fs_futime(loop: Loop,
                              req: Fs,
                               file: File,
                               double atime,
                               double mtime,
                               cb: uv_fs_cb);
     int uv_fs_lutime(loop: Loop,
                              req: Fs,
                               path: cstring,
                               double atime,
                               double mtime,
                               cb: uv_fs_cb);
     int uv_fs_lstat(loop: Loop,
                             req: Fs,
                              path: cstring,
                              cb: uv_fs_cb);
     int uv_fs_link(loop: Loop,
                            req: Fs,
                             path: cstring,
                             new_path: cstring,
                             cb: uv_fs_cb);
     int uv_fs_symlink(loop: Loop,
                               req: Fs,
                                path: cstring,
                                new_path: cstring,
                                flags: c.int
                                cb: uv_fs_cb);
     int uv_fs_readlink(loop: Loop,
                                req: Fs,
                                 path: cstring,
                                 cb: uv_fs_cb);
     int uv_fs_realpath(loop: Loop,
                                req: Fs,
                                 path: cstring,
                                 cb: uv_fs_cb);
     int uv_fs_fchmod(loop: Loop,
                              req: Fs,
                               file: File,
                               int mode,
                               cb: uv_fs_cb);
     int uv_fs_chown(loop: Loop,
                             req: Fs,
                              path: cstring,
                              uv_uid_t uid,
                              uv_gid_t gid,
                              cb: uv_fs_cb);
     int uv_fs_fchown(loop: Loop,
                              req: Fs,
                               file: File,
                               uv_uid_t uid,
                               uv_gid_t gid,
                               cb: uv_fs_cb);
     int uv_fs_lchown(loop: Loop,
                              req: Fs,
                               path: cstring,
                               uv_uid_t uid,
                               uv_gid_t gid,
                               cb: uv_fs_cb);
     int uv_fs_statfs(loop: Loop,
                              req: Fs,
                               path: cstring,
                               cb: uv_fs_cb);
     int uv_fs_poll_init(loop: Loop, handle: ^Poll);
     int uv_fs_poll_start(handle: ^Poll,
                                   uv_fs_poll_cb poll_cb,
                                   path: cstring,
                                   unsigned int interval);
     int uv_fs_poll_stop(handle: ^Poll);
     @(link_name="uv_fs_poll_getpath") fs_poll_getpath( handle: ^Poll,
                                     buffer: cstring,
                                     size: c.size_t) -> i32 ---
    @(link_name="uv_fs_event_init") fs_event_init ::proc(loop: Loop, handle: ^FsEvent) -> i32---
     int uv_fs_event_start(handle: ^FsEvent,
                                    uv_fs_event_cb cb,
                                    path: cstring,
                                    unsigned flags:c.int);
     int uv_fs_event_stop(handle: ^FsEvent);
     int uv_fs_event_getpath(handle: ^FsEvent,
                                      buffer: cstring
                                      size: c.size_t);
    
     int uv_ip4_addr(ip: cstring, port: c.int, struct sockaddr_in* addr);
     int uv_ip6_addr(ip: cstring, port: c.int, struct sockaddr_in6* addr);
    
     int uv_ip4_name(const struct sockaddr_in* src, char* dst, size_t size);
     int uv_ip6_name(const struct sockaddr_in6* src, char* dst, size_t size);
     int uv_ip_name(const struct sockaddr* src, char* dst, size_t size);
    
     int uv_inet_ntop(int af, const void* src, char* dst, size_t size);
     int uv_inet_pton(int af, const char* src, void* dst);

    
     int uv_random(loop: Loop,
                            uv_random_t* req,
                            buf: rawptr,
                            size_t buflen,
                            unsigned flags,  /* For future extension; must be 0. */
                            uv_random_cb cb);
   
    
    @(link_name="uv_if_indextoiid")   int uv_thread_create_ex( tid :^Thread,
                                       params,
                                      uv_thread_cb entry,
                                      arg: rawptr);
     @(link_name="uv_if_indextoiid")  int uv_thread_setaffinity(uv_thread_t* tid,
                                        char* cpumask,
                                        char* oldmask,
                                        size_t mask_size);
    @(link_name="uv_if_indextoiid")   int uv_thread_getaffinity(uv_thread_t* tid,
                                        char* cpumask,
                                        size_t mask_size);
   @(link_name="uv_if_indextoiid")     uv_thread_getcpu() -> c.int ---
    @(link_name="uv_if_indextoiid")   uv_thread_t uv_thread_self();
     @(link_name="uv_if_indextoiid")  int uv_thread_join(uv_thread_t *tid);
     @(link_name="uv_if_indextoiid")  int uv_thread_equal(const uv_thread_t* t1, const uv_thread_t* t2);
     @(link_name="uv_if_indextoiid")  int uv_thread_setname(name: cstring);
     @(link_name="uv_if_indextoiid")  int uv_thread_getname(uv_thread_t* tid, char* name, size_t size);
}

