#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit 1

ENV_FILE=.env
if [ ! -f "$ENV_FILE" ]; then
  echo \
"MYSQL_ROOT_PASSWORD=
MYSQL_PASSWORD=

MYSQL_PORT=3370
BACKEND_PORT=8070
FRONTEND_PORT=3070

FRONTEND_URLS=https://hla.lukas-ist-ein-geiler-hund.de,https://labeling.stabilodigital.de
BACKEND_URL=https://hla.lukas-ist-ein-geiler-hund.de/api
" \
> "$ENV_FILE"
fi

UPDATE_SCRIPT_FILE=_update_files.sh
if [ ! -f "$UPDATE_SCRIPT_FILE" ]; then
  echo \
"#!/bin/bash

echo 'TODO: Please provide a way to update the sample images automatically'
" \
> "$UPDATE_SCRIPT_FILE"
fi

SAMPLES_DIR=samples
if [ ! -d "$SAMPLES_DIR" ]; then
  mkdir $SAMPLES_DIR
fi

EXAMPLES_DIR=examples
if [ ! -d "$EXAMPLES_DIR" ]; then
  mkdir $EXAMPLES_DIR
fi

CONFIG_FILE=$SCRIPT_DIR/config/batch_service_config.json
if [ ! -f "$CONFIG_FILE" ]; then
  echo \
"{
   \"samplesOrigin\": \"xai_sentences\",
   \"batchSize\": 10,
   \"targetExpertAnswerCount\": 1,
   \"targetAnswerCount\": 3,
   \"prioritizedReferenceSentences\": [
     {
       \"referenceSentencesId\": 1,
       \"priority\": 1
     }
   ],
   \"prioritizedQuestions\": [
     {
       \"questionId\": 1,
       \"priority\": 1
     }
   ]
 }
" \
> "$CONFIG_FILE"
fi