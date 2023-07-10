lua << EOF
package.loaded['anderson'] = nil
package.loaded['anderson.colors'] = nil
package.loaded['anderson.highlights'] = nil
package.loaded['anderson.utils'] = nil

require('anderson').setup()
EOF
