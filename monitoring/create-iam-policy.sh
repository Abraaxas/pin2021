# Crear la carpeta logging dentro de
mkdir -p ~/environment/logging/
# Crear el archivo fluent-bit-policy.json
cat <<EoF > ~/environment/logging/fluent-bit-policy.json
{
"Version": "2012-10-17",
"Statement": [
{
"Action": [
"es:ESHttp*"
],
"Resource":
"arn:aws:es:us-east-2:465468088979:domain/eksworkshop-logging/*",
"Effect": "Allow"
}
]
}
EoF
# Crear la policy de fluent bit
aws iam create-policy \
--policy-name fluent-bit-policy \
--policy-document file://~/environment/logging/fluent-bit-policy.json
