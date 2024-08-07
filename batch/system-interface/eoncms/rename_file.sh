TARGET_DIR="$1"
START_POS=1

echo TARGET DIR = $TARGET_DIR
echo START_POS = $START_POS

pushd $TARGET_DIR
for file in *
do
  mv $file $(expr substr $file $START_POS 9)
done

popd
