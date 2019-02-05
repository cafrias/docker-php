clear
if [ -z "$1" ]
    then
        NAMESPACE="carlosafrias"
    else
        # Accepts custom namespacing
        NAMESPACE=$1
fi
echo "Building images on all subdirectories..."

for D in *; do
    if [ -d "${D}" ] && [ -s "${D}/Dockerfile" ]; then
        echo "  -- Building image for ${D} ..."
        docker build -t ${NAMESPACE}/php:${D} ${D}/
    fi
done

echo "Done!"
