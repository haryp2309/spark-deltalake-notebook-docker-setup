# Spark Deltalake Notebook Docker Setup
This provides a template setup for Spark and Deltalake with Jupyter Notebook via Docker. To test it out, run these steps.

1. Install the requirements.
    - Docker or Podman
    - Docker Compose or Podman Compose
    - VS Code (optional)
2. From the root of this repo, run `docker compose up`.
3. Open the link shown in the terminal (probably starting with `http://127.0.0.1:8889/`) in your browser to view the Jupyter Notebook.
4. (Optional) In VS Code, download the Python and Jupyter related extensions. When opening a local Jupyter notebook, select "Exisiting Jupyter Server..." as Jupyter kernel. When asked for url, paste the URL from the terminal.

## File Structure

```
.
├── Dockerfile              | Dockerfile describing the Docker image for this 
│                           | project.
│                           
├── README.md               | This file.
│                           
├── app                     | Contains scripts used when building the Docker 
│   │                       | image.
│   │
│   ├── requirements.txt    | Python package requirements for the image
│   │
│   └── start-spark.sh      | Starting script used to start Spark with DeltaLake
│                           | support using Jupyter Notebook
│
├── compose.yaml            | Docker-composefile to start the image with the
│                           | correct configurations
│
└── home                    | The working directory for Jupyter Notebooks. This
    │                       | folder will be mounted within the container so the
    │                       | working files will be persisted between sessions.
    │
    └── .gitignore          | A gitignore file for ignoring all working files. 
                            | Remove this file if you want to push the working
                            | files to git.
```