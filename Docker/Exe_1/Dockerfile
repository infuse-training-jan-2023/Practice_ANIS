FROM python
WORKDIR /src/
ARG arg1
ARG arg2
ENV Argument1=${arg1}
ENV Argument2=${arg2}
RUN echo ${arg1}
RUN echo ${arg2}
COPY Exe_1/add_no_script.py .
CMD python add_no_script.py
