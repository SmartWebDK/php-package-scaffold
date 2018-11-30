{
    "name": "smartweb/{{.Name}}",
    "description": "{{.Description}}",{{if .Author.Name}}
    "authors": [
        {
            "name": "{{.Author.Name}}"{{if .Author.Email}},
            "email": "{{.Author.Email}}"{{end}}
        }
    ],{{end}}
    "type": "library",
    "minimum-stability": "dev",
    "prefer-stable": true,
    "repositories": [
        {
            "type": "composer",
            "url": "https://composer.smartweb.io/"
        }
    ],
    "require": {
        "php": ">=7.1"
    },
    "require-dev": {
        "roave/security-advisories": "dev-master",
        "phpunit/phpunit": "^7"
    },
    "autoload": {
        "psr-4": {
            "{{.Data.composerNamespace}}\\": "src/"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "{{.Data.composerNamespace}}\\Tests\\": "tests/"
        }
    },
    "config": {
        "preferred-install": "dist",
        "sort-packages": true,
        "platform": {
            "php": "7.1.20",
            "ext-mbstring": "0.1"
        }
    }
}
