# Blocklists & Allowlists

Custom DNS lists for Pi-hole filtering.

## Files

### `allow-list.txt`

Domains that should **NOT** be blocked (whitelist). Add domains here that are being incorrectly blocked by your active blocklists.

**Format**: One domain per line

```
example.com
trusted-service.com
```

### `block-list.txt`

Domains that should be blocked (blacklist). Add domains here that you want to block network-wide.

**Format**: One domain per line

```
ads.example.com
tracker.example.com
```

## Adding Lists to Pi-hole

### Adding Lists from a Repository

1. Open Pi-hole Admin Dashboard
2. Navigate to **Adlists** (or **Gravity** → **Adlists** depending on your version)
3. Click **Add New Adlist**
4. Paste the raw URL to the list file, for example:
   - `https://raw.githubusercontent.com/your-repo/lists/main/allow-list.txt`
   - `https://raw.githubusercontent.com/your-repo/lists/main/block-list.txt`
5. (Optional) Add a description in the **Comment** field
6. Click **Add** to save
7. Pi-hole will automatically sync the list according to the update frequency

### Adding Local Lists

For lists stored locally on your Pi-hole system:

1. Open Pi-hole Admin Dashboard
2. Navigate to **Adlists**
3. For **local lists**, you can:
   - Upload files via the dashboard
   - Use local file paths (e.g., `/etc/pihole/allow-list.txt`)
   - Copy-paste contents directly

### List Update Frequency

- **Default Update Interval**: Pi-hole checks for list updates every **24 hours** (1 day)
- **Manual Update**: You can force an immediate update by running `pihole -g` in the terminal or via the dashboard
- **Custom Frequency**: To change the update frequency:
  1. SSH into your Pi-hole
  2. Edit `/etc/pihole/pihole-FTL.conf`
  3. Look for `GRAVITY_UPDATE_INTERVAL` and set your preferred interval (in hours)
  4. Restart Pi-hole: `sudo systemctl restart pihole-FTL`

**Note**: More frequent updates increase server load. 24 hours is recommended for most users.

## Best Practices

- **Keep lists organized**: One domain per line
- **Use comments sparingly**: Add `# comment` for clarity
- **Test changes**: Monitor your network for issues
- **Regular maintenance**: Review and update periodically

## Examples

### Allow-list Example

```
# Trusted services
discord.com
reddit.com
github.com
```

### Block-list Example

```
# Known ad servers
ads.example.com
tracker.example.com
analytics.example.com
```

## Syncing with Pi-hole

### Using Pi-hole's Web Interface

1. Create lists in this directory
2. Import via dashboard or command line
3. Enable/disable as needed

### Command Line (Advanced)

```bash
# Copy lists to Pi-hole
sudo cp allow-list.txt /etc/pihole/
sudo cp block-list.txt /etc/pihole/

# Update Gravity
pihole -g
```

## Sharing Custom Lists

If you want to share your lists publicly:

1. Ensure no sensitive information is included
2. Add descriptions via comments
3. Consider hosting online for others to use

## Related Documentation

See [../docs/LISTS.md](../docs/LISTS.md) for information about public blocklists and recommendations.
