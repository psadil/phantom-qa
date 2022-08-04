FROM mambaorg/micromamba:0.24-jammy

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yml /tmp/env.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER src/aa-fmri-phantom-qa /opt/aa-fmri-phantom-qa
 
RUN micromamba install --name base --yes --file /tmp/env.yml  \
    && rm /tmp/env.yml \
    && micromamba clean --yes --all \ 
    && chmod +x /opt/aa-fmri-phantom-qa/run_phantom_qa.py

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "/opt/aa-fmri-phantom-qa/run_phantom_qa.py"]
