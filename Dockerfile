FROM public.ecr.aws/aws-cli/aws-cli AS aws-cli

FROM golang:1 AS builder

WORKDIR /app

COPY . .
RUN go build .


FROM ubuntu

WORKDIR /app

COPY --from=aws-cli /usr/local/aws-cli/ /usr/local/aws-cli/
RUN ln -s /usr/local/aws-cli/v2/current/bin/aws /usr/local/bin/aws

COPY --from=builder /app/main ./
COPY run.sh ./
