# Usage

If you can't setup 'fpm' command in your local environment,
you can use this docker image.

Replace `fpm` command by this command.

```bash
    docker run -v $PWD:/WD -w /WD fpm fpm <arguments>
```
