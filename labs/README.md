# COMS20011_2020 Labs

The labs are all Jupyter Notebooks.  Please get set up with them as soon as possible: I've left Lab 1 up to allow you to test.

There are two basic options: remotely logging in to a lab machine or locally installing Python (not supported).

## Remote access to MVB machines

* Option 1 - First, follow these instructions to set up the [VPN](https://uob.sharepoint.com/sites/itservices/SitePages/vpn-connect.aspx). Then, follow these guidelines provided by IT Services to set up a [Linux Remote Desktop](https://uob.sharepoint.com/sites/itservices/SitePages/fits-engineering-linux-x2go.aspx)

* Option 2 (advanced) - If you are running an X server already (i.e. because you're running Linux locally), then open a shell on your machine, and type this command: 
```
ssh -X -J youruserid@seis.bris.ac.uk youruserid@rd-mvb-linuxlab.bristol.ac.uk
```

## Locally installing Anaconda

*This is not supported!*

1. Install anaconda on your computer: [instructions](https://docs.anaconda.com/anaconda/install/).

Then install jupyter notebook
```shell
$ conda install -c anaconda jupyter
```

2. Clone this repository
```shell
$ git clone git@github.com:LaurenceA/COMS20011_2020.git
```

3. Enter a new lab
```shell
$ cd COMS20011_2020/labs/lab_1
```

You are going to create a new virtual environment for this lab, as we will assume that project dependencies may differ in future labs. It is always best practice to create virtual environments whenever you're working with Python. To learn more about virtual environments in Python, [read more](https://towardsdatascience.com/virtual-environments-104c62d48c54).

Anaconda is a tool that will help us manage our virtual environments and install any dependencies used in data science projects.

4. Create a new anaconda virtual environment
```shell
$ conda create --name lab1
```

Next we need to activate that environment for the current shell

5. Activate conda environment
```shell
$ conda activate lab1
```

If you get a `CommandNotFoundError` this justs means you need to configure your shell to work properly with anaconda and so follow the instructions using `$ conda init <SHELL_NAME` e.g. `$ conda init bash` or `$ conda init zsh`

6. Open a new shell and you'll notice something pre-pended to your prompt
```
(base) ~ $ 
```
This means that anaconda is using the base environment. You need to switch to the environment you just created using `$ conda activate lab1`

You should see 
```shell
(lab1) ~ $
```
for example. You are ready to install your dependencies for the environment.

7. Install ipykernel

```shell
(lab1) $ conda install ipykernel  
```

8. Run Jupyter notebook

```shell
(lab1) $ jupyter notebook
```

9. In the toolbar, go to *Kernel->Change kernel->lab1* to activate the environment

Optional: Install any missing dependencies.

If you get any `ModuleNotFoundError`s when running your code, simply switch back to the terminal within the environment and install them.

e.g.
```shell
(lab1) $ pip install numpy scipy
```

## Starting a Notebook on the lab machines:
Open a terminal, and enter:
```
/opt/anaconda3-4.4.0/bin/jupyter notebook
```
Jupyter should automatically open a webpage. If not, open your favourite web browser and go to: localhost:8888/notebooks.
