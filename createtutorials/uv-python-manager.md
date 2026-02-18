[[Topic UV python ]] Uv's Commands
    
UV Self Update: 
    
    `$ uv self update 

To update your UV installation, simply run the command `$ uv self update` in your terminal or command prompt. This will result in a file system scan to locate any outdated components of your `uv` package, allowing for easy updates and ensuring you have access to the latest features and security patches.

To install a package use:

	 `$ uv pip install <package-name> 

The uv pip install command is used to download, extract and install packages from the Python Package Index (PyPI), allowing you to easily add new features, libraries or tools to your UV installation.

First I would create my project working folder `$ cd into that directory
then Run the following commands to create the `venv

Create a Virtual environment:

	`$ uv venv
 
To upgrade pip using the uv command, you can run 

`$ uv pip install --upgrade pip`. 

This command will update pip to the latest version available.

This will create a new virtual environment for your UV installation, allowing you to isolate dependencies and keep your project's Python version separate from your system's Python version. The virtual environment will be created in the current working directory by default, but you can specify a different location if needed. To activate the virtual environment, simply run $ uv activate from within it, or use

To stop using a virtual environment called `<env-name>` that you started with `$ uv workon`, just type:

	`$ uv deactivate.`

The virtual environment will be automatically deleted when it is deactivated. Note that the name of the environment can also be changed by running 

	$ uv rename &lt;old-name&gt; &lt new-name&gt;

After it has been activated, to help keep track of multiple environments if needed. to switch between multiple virtual environments. When creating a new virtual environment, make sure to select the Python version that matches your project's requirements to avoid compatibility issues. Once activated, you can manage packages using the standard pip commands, such as `$ uv pip install <package-name>, and then deactivate with $ uv deactivate` when finished.

UV tools can help you add new things (called packages) to your project for a short time. Use the `$ uv pip install <package-name>` command to download, extract and install packages from the Python Package Index (PyPI), allowing you to easily add new features, libraries or tools to your UV installation. When using UV tools, it is essential to note that all changes are temporary and will be removed when you deactivate the environment.

---

To create a virtual environment, run  `$ uv venv <env-name>`. To add a package like "broker", type `$ uv tool install broker`.

UV has a command `$ uvx posting` which allows you to post a message on a specific topic or channel, and also provides some additional functionality such as the ability to share files, images, or videos, and even live stream your screen. When using this command, make sure to specify the correct format for the message you want to post, as the default format will be used if no format is provided. To use the $uvx posting command, simply run $uvx posting <topic> with the desired message, and optionally include additional formatting options such as file attachments, images, or videos, using the specified formats (e.g. markdown, html) to ensure proper rendering of your content.

For example, to post a message in Markdown format, use the &#x60;$ uvx posting -f markdown &lt;topic&gt;&#x60; command, and then specify your message in Markdown syntax. Similarly, to share an image file, you can use the $uvx posting -i <image-file-path> option.

Additionally, if you want to live stream your screen, you will need to enable screen sharing from within UV's settings menu, which can be accessed by running $ uvx settings and then selecting the "Screen Sharing" tab. Once enabled, you can use the $ uvx posting Once you have enabled screen sharing in your UV settings, you can start a live stream using the $ uvx posting command with the -l option. For example, to post a live video of your screen, run the following command:

	`$ uvx posting -f html -i -l <topic>`

This will allow you to share your screen with others in real-time, making it easier to collaborate or provide remote support. Additionally, you can also use this feature to record videos of your screen, which can be useful for creating tutorial content or sharing complex processes with others.

To stop the live stream, simply press the stop button that appears on your screen when using UV's screen sharing feature.
 
 
