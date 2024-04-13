# Bitácora

This is a LaTex document with the purpose of being a logbook for the Hackathon.

## How it looks

<p>
    <img src="Assets/EAFIT_Version_00.png" alt="EAFIT_Version_00" width="250"/>
    <img src="Assets/EAFIT_Version_01.png" alt="EAFIT_Version_01" width="250"/>
</p>

## Dependencies

Make sure to install `texlive-full` and `texlive-latex-extra`.

```shell
# Ubuntu and some Debian based distros.
sudo apt install texlive-latex-extra texlive-full -y
# Arch and some Arch based distros.
sudo pacman -S texlive-fontsextra texlive-core texlive-latexextra texlive-pictures texlive-science
```

## Build

To build manually, just use `pdflatex`:
```shell
# Run this command inside the folder of whatever version you want.
pdflatex main.tex
```

## Docker support

1. **Build Your Docker Image**

First, you need to build the Docker image from your `Dockerfile`. Navigate to the directory containing your `Dockerfile` and run:

```bash
docker build -t latex_env .
```

This command builds a Docker image with the tag `latex_env` from the Dockerfile in the current directory. The dot `.` at the end specifies the build context as the current directory.

2. **Run Your Docker Container**

After building the image, you can run a container from it. You'll want to mount the directory containing your LaTeX project (for example, `cv.tex` and related files) to a directory inside the container so that you can access and compile your LaTeX project from within the container.

```bash
docker run -it --rm -v /path/to/your/latex/project:/project latex_env
```

Replace `/path/to/your/latex/project` with the absolute path to the directory on your host machine that contains your LaTeX project. This command mounts it to `/project` inside the container. The `-it` option allows you to interact with the container, and `--rm` automatically removes the container when you exit.

3. **Compile Your LaTeX Project**

Once inside the container, navigate to the mounted directory:

```bash
cd /project
```

Then, you can compile your LaTeX project using `xelatex`:

```bash
pdflatex cv.tex
```

This command will generate the output files (e.g., `cv.pdf`) in your project directory, which is mounted from your host, so you can access them even after the container is removed.

4. **Exit the Container**

When you're done, you can exit the container by typing `exit`. The container will stop, and due to the `--rm` flag, it will also be automatically removed.
