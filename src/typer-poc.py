import typer
import subprocess

app = typer.Typer()

# tutorial as-is
@app.command()
def hello(name: str):
    typer.echo(f"Hello {name}")

# tutorial as-is
@app.command()
def goodbye(name: str, formal: bool = False):
    if formal:
        typer.echo(f"Goodbye Ms. {name}. Have a good day.")
    else:
        typer.echo(f"Bye {name}!")

@app.command()
def backup(srcpath: str, dstpath: str, full: bool = False):
    if full:
        typer.echo(f"Full backup {srcpath} to {dstpath}.")
    else:
        typer.echo(f"Diff backup {srcpath} to {dstpath}.")

    # todo

@app.command()
def archive(srcpath: str, volname: str):
    typer.echo(f"Archive {srcpath} as {volname}.")

    # test
    cmd = f"dir2iso.sh {srcpath} {volname} foobar"
    res = subprocess.run(cmd.split())

if __name__ == "__main__":
    app()