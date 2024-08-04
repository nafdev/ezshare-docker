Dockerized version of [mifi/ezshare](https://github.com/mifi/ezshare) with some modifications.

- By default, the shared folder does not keep files. After a file is uploaded, it is deleted after a configurable amount of time
- The shared folder is not accessible from the host (no bind mount or volume), so any files uploaded will be lost when the container restarts. This could be changed by manually binding a path or volume to `/data`

### Environment variables

- `CLEAR_FILES` Whether to delete files after configured time, default is `true`
- `CLEAR_AFTER` Amount of time after a file is deleted, default is `1h`
