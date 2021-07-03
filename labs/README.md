# COMS20011_2020 Labs

The labs are all Jupyter Notebooks.  Please get set up with them as soon as possible: I've left Lab 1 up to allow you to test.

There are two basic options: remotely logging in to a lab machine or locally installing Python (not supported).

## Remote access to MVB machines

#### Option 1 (Linux Remote Desktop; Windows/Linux)
First, follow these instructions to set up the [VPN](https://uob.sharepoint.com/sites/itservices/SitePages/vpn-connect.aspx). Then, follow these guidelines provided by IT Services to set up a [Linux Remote Desktop](https://uob.sharepoint.com/sites/itservices/SitePages/fits-engineering-linux-x2go.aspx).  Should work on Mac, but apparently the required XQuartz software doesn't work well.  This is supported by IT, so any issues with this software can be sent to service-desk@bristol.ac.uk.

#### Option 2 (X Remote Desktop; Linux)
If you are running an X server already (i.e. because you're running Linux locally), then open a shell on your machine, and type this command: 
```
ssh -X -J youruserid@seis.bris.ac.uk youruserid@rd-mvb-linuxlab.bristol.ac.uk
```
This method will not work on Windows Linux Subsystem (WSL), you can use Option 3 in WSL, or Option 1 in Windows, instead.

#### Option 3 (SSH Port forwarding; WSL/Linux/Mac)
If you can get it working, this method will give the lowest latency.

This allows you to open Jupyter Notebook in a browser on your local machine while still running it on a lab machine.

1. Map a free port on your machine (e.g. 6006) to a free port on the lab machine (e.g. 7373)
```
ssh -L 6006:localhost:7373 -J user@seis.bris.ac.uk user@rd-mvb-linuxlab.bristol.ac.uk
```
       
2. Run Jupyter Notebook on the port mapped to your local machine: 7373
```
/opt/anaconda3-4.4.0/bin/jupyter notebook --no-browser --port 7373
```
      
3. Open localhost:6006 in a web browser on your local machine and enter the token provided by Jupyter Notebook.

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
$ conda create --name labs
```

Next we need to activate that environment for the current shell

5. Activate conda environment
```shell
$ conda activate labs
```

If you get a `CommandNotFoundError` this justs means you need to configure your shell to work properly with anaconda and so follow the instructions using `$ conda init <SHELL_NAME` e.g. `$ conda init bash` or `$ conda init zsh`

6. Open a new shell and you'll notice something pre-pended to your prompt
```
(base) ~ $ 
```
This means that anaconda is using the base environment. You need to switch to the environment you just created using `$ conda activate labs`

You should see 
```shell
(labs) ~ $
```
for example. You are ready to install your dependencies for the environment.

7. Install ipykernel

```shell
(labs) $ conda install ipykernel  
```

```shell
(labs) $ python -m ipykernel install --user --name labs
```

8. Run Jupyter notebook

```shell
(labs) $ jupyter notebook
```

9. Select the file `labsheet1.ipynb`

10. In the toolbar, go to *Kernel->Change kernel->lab1* to activate the environment

Optional: Install any missing dependencies.

If you get any `ModuleNotFoundError`s when running your code, simply switch back to the terminal within the environment and install them.

e.g.
```shell
(labs) $ conda install numpy scipy
```

## Starting a Notebook on the lab machines:
Open a terminal, and enter:
```
/opt/anaconda3-4.4.0/bin/jupyter notebook
```
Jupyter should automatically open a webpage. If not, open your favourite web browser and go to: localhost:8888/notebooks.

## Clone Lab sheet to Lab Machine
This allows you to clone the lab sheet to lab machine using terminal.

1. Open the terminal in the Linux remote desktop, or through `ssh` (option 3) from your local machine.

2. Clone the lab repository from Github to your lab machine.
```
git clone https://github.com/LaurenceA/COMS20011_2020.git
```
3. Pull the repository each time before the lab to get the latest updates of the repository.
```
cd COMS20011_2020
git pull
```

| Labsheet link | Labsheet answers |
|---------------|------------------|
|[[Labsheet 1]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_1/labsheet1.ipynb) | [[Answers 1]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_1/labsheet1_answers.ipynb) |
|[[Labsheet 2]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_2/labsheet2.ipynb) | [[Answers 2]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_2/labsheet2_answers.ipynb) |
|[[Labsheet 3]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_3/labsheet3.ipynb) | [[Answers 3]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_3/labsheet3_answers.ipynb)|
|[[Labsheet 4]](https://github.com/LaurenceA/COMS20011_2020/blob/main/labs/lab_4/labsheet4.ipynb) | [[Answers 4]](lab_4/labsheet4_answers.ipynb)

