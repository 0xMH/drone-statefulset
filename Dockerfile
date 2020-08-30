FROM bitnami/kubectl:1.17

COPY init-kubectl install.sh /opt/sinlead/kubectl/bin/

USER root

ENV PATH="/opt/sinlead/kubectl/bin:$PATH"

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/sinlead/kubectl/bin/install.sh"]
