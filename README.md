
<div align="center">
  <h1>Touch Grass</h1>
  <p>Vishnu Menon, Naron Chen, Ramsha Perwez, Eric Riese, Chaitanya Kumar, and Siwu Li</p>
</div>
<br><br>

<img src="https://github.com/humboldt123/touch-grass/assets/38266782/764bcf70-21fd-45ff-b942-0b035e91b7fe" alt="Touch Grass UI" width="20%" align="right"/>


> [!CAUTION]
> ⭐ Our project for Philly Codefest 2024 is really cool

**What is Touch Grass**

We love bringing people together! Touch Grass is a cross-platform app that __leverages AI for social good__ to help facilitate connections between people we think vibe together. We do this by giving users the **freedom to select activities that interest them**. With everyone's preferences being sent to the backend, our AI matches people it thinks are a good fit, then invites the user to no more than **one activity per day** so as not to overwhelm. This brings people together, which is where the magic happens!

The name was Naron's idea.

**How to Use the App**

1. When you land you will be greeted with the main screen.
2. Swipe-up from the bottom modal, and feel free to enter your name, birthday, and activities that might interest you.
3. Swipe back down and accept today's curated event, or wait until tommorow.

**Our Process**

Our project consists of a frontend and a backend. Vishnu mocked-up the frontend in Figma then implemented it in React Native. 

Eric set up Supabase, found green space locations on OpenDataPhilly, created an API for finding the nearest one, and created a batch job for generating events for each group at the nearest location.

The backend was built upon RESTful APIs. Which make numerous calls to the frontend, collecting user information while use our fine-tuned AI to put users into different social events group. After tagging each user, we made another call to the OpenAI API to generate the event and events description for the users suggestions.

**Our Tech Stack**

We built the frontend in `React Native`, and used `Supabase`, `PostgreSQL`, `PostGIS` and `Edge Functions with Typescript and Deno` for our backend, as well as `Python`, `Juptyer Notebooks` and good old `JavaScript`.


**Data Sources**

Green space is important to us. That's why we used [Open Data Philly](https://opendataphilly.org/) to find Community Gardens<sup>[[1](https://opendataphilly.org/datasets/registered-community-gardens/)]</sup>, Picnic Sites<sup>[[2](https://opendataphilly.org/datasets/ppr-picnic-sites/)]</sup> and Urban Agriculture<sup>[[3](https://opendataphilly.org/datasets/urban-agriculture-projects/)]</sup>

[Figma Mockup](https://www.figma.com/file/kGjD61HmgKpH2Q7C2CH1hZ/TouchGrassApp) | [Canva Presentation](https://www.canva.com/design/DAGDC486pfs/aJ0URzSP3TpBWjlrLe2QOg/view)


<br><br><br><br>
**Video Demo**
<div>
  <video src="https://github.com/humboldt123/touch-grass/assets/38266782/b3205319-43c9-44c6-ad64-ff6780b51340" height="30%"/>
</div>
