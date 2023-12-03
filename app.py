import streamlit as st
import pandas as pd
import mysql.connector

# Connect to the MySQL database
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Pointbreak1!",
        database="movieawardceremony"
    )
    return connection

# Create a cursor object to execute SQL queries
def add_new_movie():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New Movie")
    movie_title = st.text_input("Enter Movie Title:")
    release_year = st.number_input("Enter Release Year:", min_value=1800, max_value=9999, step=1, format="%d", key="release_year")
    genre = st.text_input("Enter Genre:")
    director = st.text_input("Enter Director:")
    producerID = st.text_input("Enter Producer ID:")

    if st.button("Add Movie"):
        if movie_title and release_year and genre and director and producerID:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO movies (title, release_year, genre, director, producerid) VALUES (%s, %s, %s, %s, %s)"
            values = (movie_title, release_year, genre, director, int(producerID))

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("Movie added successfully!")

        else:
            st.error("Movie Title, Release Year, Genre, Director, and Producer ID are required fields!")

    cursor.close()
    connection.close()


def add_new_actor():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New Actor")
    actor_name = st.text_input("Enter Actor Name:")
    birth_date = st.date_input("Enter Birth Date:")
    gender = st.selectbox("Select Gender:", ["Male", "Female", "Other"])
    contact_information = st.text_input("Enter Contact Information:")
    biography = st.text_area("Enter Biography:")

    if st.button("Add Actor"):
        if actor_name and birth_date:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO actors (ActorName, DateOfBirth, Gender, ContactInformation, Biography) VALUES (%s, %s, %s, %s, %s)"
            values = (actor_name, birth_date, gender, contact_information, biography)

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("Actor added successfully!")

        else:
            st.error("Actor Name and Birth Date are required fields!")

    cursor.close()
    connection.close()


def add_new_director():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New Director")
    director_name = st.text_input("Enter Director Name:")
    birth_date = st.date_input("Enter Date of Birth:")
    gender = st.selectbox("Select Gender:", ["Male", "Female", "Other"])
    contact_info = st.text_input("Enter Contact Information:")
    
    if st.button("Add Director"):
        if director_name and birth_date and gender and contact_info is not None:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO Directors (DirectorName, DateOfBirth, Gender, ContactInformation) VALUES (%s, %s, %s, %s)"
            values = (director_name, birth_date, gender, contact_info)

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("Director added successfully!")

        else:
            st.error("All fields are required!")

    cursor.close()
    connection.close()


def add_new_producer():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New Producer")
    producer_name = st.text_input("Enter Producer Name:")
    production_company = st.text_input("Enter Production Company:")
    contact_info = st.text_input("Enter Contact Information:")
    biography = st.text_area("Enter Biography:")
    

    if st.button("Add Producer"):
        if producer_name and production_company and contact_info and biography is not None:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO Producers (ProducerName, ProductionCompany, ContactInformation, Biography) VALUES (%s, %s, %s, %s)"
            values = (producer_name, production_company, contact_info, biography)

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("Producer added successfully!")

        else:
            st.error("All fields are required!")

    cursor.close()
    connection.close()


def add_new_song():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New Song")
    song_title = st.text_input("Enter Song Title:")
    singer = st.text_input("Enter Singer:")
    music_director = st.text_input("Enter Music Director:")
    lyrics_by = st.text_input("Enter Lyrics By:")
    
    if st.button("Add Song"):
        if song_title and singer and music_director and lyrics_by  is not None:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO Songs (SongTitle, Singer, MusicDirector, LyricsBy) VALUES (%s, %s, %s, %s)"
            values = (song_title, singer, music_director, lyrics_by)

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("Song added successfully!")

        else:
            st.error("All fields are required!")

    cursor.close()
    connection.close()


def add_new_user():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Add New User")
    user_id = st.text_input("Enter User ID:")
    first_name = st.text_input("Enter First Name:")
    last_name = st.text_input("Enter Last Name:")
    email = st.text_input("Enter Email:")
    phone_number = st.text_input("Enter Phone Number:")
    address = st.text_area("Enter Address:")

    if st.button("Add User"):
        if user_id and first_name and last_name and email and phone_number and address:
            # Build the SQL query based on provided fields
            sql_query = "INSERT INTO users (user_id, first_name, last_name, email, phone_number, address) VALUES (%s, %s, %s, %s, %s, %s)"
            values = (user_id, first_name, last_name, email, phone_number, address)

            # Execute the SQL query with the values
            cursor.execute(sql_query, values)
            connection.commit()
            st.success("User added successfully!")

        else:
            st.error("All fields are required!")

    cursor.close()
    connection.close()    


def vote_for_category():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Vote for Category")

    category = st.selectbox("Select Category:", ["Movie", "Actor", "Director", "Producer", "Song"], key="category_selectbox")

    if category:
        # Get the specific title based on the selected category
        title_column_name = ""
        if category == "Movie":
            title_column_name = "Title"
        elif category == "Actor":
            title_column_name = "ActorName"
        elif category == "Director":
            title_column_name = "DirectorName"
        elif category == "Producer":
            title_column_name = "ProducerName"
        elif category == "Song":
            title_column_name = "SongTitle"

        cursor.execute(f"SELECT {title_column_name} FROM {category}s")
        titles = [result[0] for result in cursor.fetchall()]

        selected_title = st.selectbox(f"Select {category}:", titles, key=f"{category.lower()}_selectbox")

        if selected_title:
            user_id = st.text_input("Enter User ID:", key="user_id_input")
            user_id = user_id.strip()

            if user_id:
                try:
                    # Insert a new row into the votes table, triggering the UpdateVoteCounts trigger
                    cursor.execute("INSERT INTO votes (user_id, category, item_name, vote_count) VALUES (%s, %s, %s, 1)",
                                   (int(user_id), category, selected_title))
                    connection.commit()  # Commit the changes to trigger the trigger
                    st.success(f"Vote recorded successfully for {selected_title} in {category}")

                except mysql.connector.Error as err:
                    if err.errno == 45000:
                        st.warning(err.msg)
                    else:
                        st.error(f"Error: {err}")

    cursor.close()
    connection.close()


def determine_winners():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Determining Winners")

    categories = ["Movie", "Actor", "Director", "Producer", "Song"]

    winners = {}

    for category in categories:
        st.write(f"Determining Winner for {category}")

        # Use SQL aggregate functions to get the winner
        cursor.execute("""
            SELECT item_name, SUM(vote_count) AS total_votes
            FROM votes
            WHERE category=%s
            GROUP BY item_name
            ORDER BY total_votes DESC
            LIMIT 1
        """, (category,))

        result = cursor.fetchone()

        if result:
            winner_item, total_votes = result
            winners[category] = winner_item

            st.write(f"{winner_item}: Total Votes = {total_votes}")

    cursor.close()
    connection.close()

    # st.write("Winners:")
    # for category, winner in winners.items():
    #     st.write(f"Category: {category}, Winner: {winner}")


def generate_voting_report_with_ties():
    connection = get_db_connection()
    cursor = connection.cursor()

    st.write("Generating Voting Report with Ties")

    try:
        # Call the SQL function
        cursor.execute("SELECT GenerateVotingReportWithTies()")

        # Fetch the result from the stored function
        result = cursor.fetchone()

        if result:
            # Print the result
            st.write(result)

    except mysql.connector.Error as err:
        # Handle errors
        st.write(f"Error: {err}")

    finally:
        cursor.close()
        connection.close()


def non_admin_page():
    choice = "search_actors"
    menu = [
        "Home",
        "Vote for Category"
    ]
    choice = st.sidebar.selectbox("Menu", menu)
    if choice == "Vote for Category":
        vote_for_category()
        
def first_page():
    choice = "home"
    menu = [
        "Home",
        "Add Movie",
        "Add Actor",
        "Add Director",
        "Add Producer",
        "Add Song",
        "Add User",
        "Generate Voting Report"
    ]
    choice = st.sidebar.selectbox("Menu", menu)

    if choice == "Home":
        st.subheader("Welcome to Movie Award Ceremony Management")
        st.write("Manage movies, actors, directors, producers, songs, users, and more!")

    elif choice == "Add Movie":
        add_new_movie()

    elif choice == "Add Actor":
        add_new_actor()

    elif choice == "Add Director":
        add_new_director()

    elif choice == "Add Producer":
        add_new_producer()

    elif choice == "Add Song":
        add_new_song()

    elif choice == "Add User":
        add_new_user()

    elif choice == "Determine Winners":
        determine_winners()

    elif choice == "Generate Voting Report":
        generate_voting_report_with_ties()


def main():
    custom_css = """
        <style>
            .stApp {
                background-color: #BC8F8F;  # You can change the color as needed
            }
        </style>
    """

    # Inject custom CSS with the `st.markdown()` function
    st.markdown(custom_css, unsafe_allow_html=True)
    username = ""
    password = ""
    login_placeholder = st.empty()

    if "login" not in st.session_state:
        st.session_state.login = False
        st.session_state.is_admin = False

    if not st.session_state.login:
        st.title("User Login")
        username = st.text_input("Username", key="username")
        password = st.text_input("Password", type="password", key='password_input')

        if st.button("Login"):
            if username == 'admin' and password == '123':
                st.session_state.login = True
                st.session_state.is_admin = True
                login_placeholder.empty()
            elif username == 'user' and password == '123':
                st.session_state.login = True
                login_placeholder.empty()
            else:
                st.error("Invalid username or password. Please try again.")

    if st.session_state.login:
        if st.session_state.is_admin:
            first_page()
        else:
            non_admin_page()



if __name__ == "__main__":
    main()
