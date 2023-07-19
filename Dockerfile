# Start with the official Jupyter notebook image
FROM jupyter/base-notebook:python-3.9.7

# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy notebook.ipynb
COPY policystorm.ipynb /app/

# Trust the notebook
RUN jupyter trust /app/policystorm.ipynb

# Expose port 8866 (Voila runs on this port)
EXPOSE 8866

# Run Voila when the container launches
CMD ["voila", "--no-browser", "--port=8866", "--enable_nbextensions=True", "--Voila.ip='0.0.0.0'", "--theme=dark", "/app/policystorm.ipynb"]


