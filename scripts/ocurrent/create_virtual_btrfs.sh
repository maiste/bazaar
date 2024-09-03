
# Setup vars
PATH="$1"
N="$2"
MOUNT="$3"

# Create the empty file
dd if=/dev/zero of="$PATH" bs=1000M count="$N"

# Load an format the virtual dis
BTRFS=$(sudo losetup -f)
sudo losetup -P "$BTRFS" "$PATH"
sudo mkfs.btrfs -f "$BTRFS"

# Create the mounting point and mount the filesystem
sudo mkdir "$MOUNT"
sudo mount -t btrfs "$PATH" "$MOUNT"
sudo chown "$USER":"$USER" $MOUNT
