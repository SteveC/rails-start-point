# Rails Start Point

A baseline Rails application featuring user authentication via Google OAuth and Bootstrap styling. Built with Rails 8.

## Features

*   **Framework:** Ruby on Rails 8.0.1
*   **Database:** PostgreSQL
*   **Authentication:** Google OAuth 2.0 using `omniauth-google-oauth2`
*   **Frontend Styling:** Bootstrap 5 (via `cssbundling-rails` with Sass)
*   **JavaScript:** Import Maps (`importmap-rails`)
*   **Basic Layout:** Includes a Bootstrap navbar with login/logout functionality.

## Prerequisites

Before you begin, ensure you have the following installed:

*   **Ruby:** Version 3.3.6 (check with `ruby -v`)
*   **Node.js:** Version 23.11.0 (check with `node -v`)
*   **Yarn:** Version 1.x (check with `yarn -v`)
*   **PostgreSQL:** (check with `psql --version`)
*   **Bundler:** (check with `bundle -v`)

## Getting Started

Follow these steps to get the application running locally:

1.  **Clone the repository:**
    ```bash
    git clone git@github.com:SteveC/rails-start-point.git
    cd rails-start-point
    ```

2.  **Install Ruby dependencies:**
    ```bash
    bundle install
    ```

3.  **Install JavaScript dependencies:**
    ```bash
    yarn install
    ```

4.  **Set up Google OAuth Credentials:**
    *   Go to the [Google Cloud Console](https://console.cloud.google.com/).
    *   Create a new project or select an existing one.
    *   Navigate to "APIs & Services" > "Credentials".
    *   Click "Create Credentials" > "OAuth client ID".
    *   Choose "Web application" as the application type.
    *   Under "Authorized redirect URIs", add: `http://localhost:3000/auth/google_oauth2/callback`
    *   Click "Create". Copy the "Client ID" and "Client Secret".
    *   Create a `.env` file in the root of the project:
        ```bash
        touch .env
        ```
    *   Add your credentials to the `.env` file:
        ```env
        GOOGLE_CLIENT_ID=YOUR_GOOGLE_CLIENT_ID_HERE
        GOOGLE_CLIENT_SECRET=YOUR_GOOGLE_CLIENT_SECRET_HERE
        ```
    *   **Important:** The `.env` file is listed in `.gitignore` and should **not** be committed to version control.

5.  **Set up the database:**
    ```bash
    rails db:setup
    ```
    This command will create the database, load the schema, and seed it (if seeds are present). If you encounter issues, you might need to run `rails db:create` and `rails db:migrate` separately. Ensure your PostgreSQL server is running and accessible. Database connection details are configured in `config/database.yml`.

6.  **Run the application:**
    You can start the Rails server using:
    ```bash
    rails server
    ```
    Alternatively, use the development server managed by `foreman` (defined in `Procfile.dev`), which also handles CSS/JS bundling in watch mode:
    ```bash
    bin/dev
    ```

7.  **Access the application:**
    Open your web browser and navigate to `http://localhost:3000`.

## Configuration

*   **Database:** Configuration is in `config/database.yml`. By default, it expects a PostgreSQL user matching your system username with no password.
*   **Google OAuth:** Credentials must be placed in the `.env` file as described in the "Getting Started" section. The OmniAuth configuration is in `config/initializers/omniauth.rb`.
*   **CSS:** Styling is managed via `cssbundling-rails`. The main entry point is `app/assets/stylesheets/application.bootstrap.scss`. Built assets are placed in `app/assets/builds`.

## Usage

*   Visit the home page at `http://localhost:3000`.
*   Click the "Sign in with Google" button in the navbar to authenticate.
*   Once logged in, your name and email will appear in the navbar, along with a "Sign Out" option.

## Running Tests

To run the test suite:

```bash
rails test
```

To run system tests (which require a browser driver like Selenium):

```bash
rails test:system
```

## Deployment

This project includes configuration for [Kamal](https://kamal-deploy.org/) in `config/deploy.yml` and `.kamal/`. You'll need to configure this file with your server details for deployment.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues.

## License

This project is intended as a starting point and does not include a specific license. Feel free to add one as needed.
