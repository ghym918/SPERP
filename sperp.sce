################################## HEADER ################################## - never modify these
scenario = "sperp";
active_buttons = 3;
button_codes = 1, 2, 3;
response_matching = simple_matching;
response_logging = log_active;
default_clear_active_stimuli = true;
pcl_file = "sperp.pcl";

$ports_enabled = 1; #should be set to 1 when in the lab, 0 for development
IF '$ports_enabled == 1';
	 write_codes = true;
	 pulse_width = 5; #necessary if output port is parallel
ENDIF;

###########################################################################
############################## VARIABLES ##################################
###########################################################################

$stim_font_size = 96;
$probe_font_size = 80;
$instruction_font_size = 36;

#background color 0-255, 255 for white, 0 for black
$bg_color = 150;
#font color 0-255
$font_color = 0;

$prime_duration = 1800;
$target_duration = 1800;
$baseline_duration = 1800;
$filler_duration = 1800;

$baseline_probe_duration = 1000;
$filler_probe_duration = 1000;

#Prompt sleep will always come after sleep, therefore the time desired between final target and prompt should be sleep_duration + prompt_sleep_duration
$sleep_duration = 200;
$prompt_sleep_duration = 800;

$fixation_duration = 2000;

$response_duration = 1000;

$yes_no_time = 2000;

$list = 1;


#########################################################################################################################################################

begin;

################################################################### WRAPPING ############################################################################
text {caption = "$list";} list_wrapper;

#########################################################################################################################################################

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} prime_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} target_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} baseline_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} filler_text;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} experimental_prompt;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} baseline_prompt;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} filler_prompt;

text {
	caption = "";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $stim_font_size;
} response_text;

text {
	width = 290;
	height = 190;
	caption = "Yes";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} yes_text;

text {
	width = 290;
	height = 190;
	caption = "No";
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	font_size = $probe_font_size;
} no_text;

box { height = 200; width = 300; color = $font_color, $font_color, $font_color;} box1;

trial { 

    trial_duration = $prime_duration;
    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text prime_text; x=0; y=0; };
        port_code = 0;
    };
	
} prime;

trial {

	trial_duration = $target_duration;
    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text target_text; x=0; y=0; };
        port_code = 0;
    };
	
} target;

trial {

	trial_duration = $baseline_duration;
    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text baseline_text; x=0; y=0; };
        port_code = 0;
    };

	
} baseline;

trial {

	trial_duration = $filler_duration;
    stimulus_event { 

        picture { background_color = $bg_color, $bg_color, $bg_color; text filler_text; x=0; y=0; };
        port_code = 0;
    };
	
} filler;

trial {
	
	trial_type = first_response;
	trial_duration = forever;

    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text experimental_prompt; x=0; y=0; };
        port_code = 19;
			time = 0;
    };
	
	picture { background_color = $bg_color, $bg_color, $bg_color;
		text experimental_prompt; x=0; y=0;
		box box1; x=-500; y=-250;
		box box1; x=500; y=-250;
		text yes_text; x=-500; y=-250;
		text no_text; x=500; y=-250;
	};
	delta_time = $yes_no_time;
	
} experimental_probe;

trial {

	trial_type = first_response; 
	trial_duration = forever;
	
    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text baseline_prompt; x=0; y=0; };
        port_code = 26;
		time = 0;
    };
	
	
	picture { background_color = $bg_color, $bg_color, $bg_color;
		text baseline_prompt; x=0; y=0;		
		box box1; x=-500; y=-250;
		box box1; x=500; y=-250;
		text yes_text; x=-500; y=-250;
		text no_text; x=500; y=-250;
	};
	delta_time = $yes_no_time;

} baseline_probe;

trial {

	trial_type = first_response;
	trial_duration = forever;

    stimulus_event {

        picture { background_color = $bg_color, $bg_color, $bg_color; text filler_prompt; x=0; y=0; };
        port_code = 33;
		time = 0;
    };
	
	
	picture { background_color = $bg_color, $bg_color, $bg_color;
		text filler_prompt; x=0; y=0;
		box box1; x=-500; y=-250;
		box box1; x=500; y=-250;
		text yes_text; x=-500; y=-250;
		text no_text; x=500; y=-250;
	};
	delta_time = $yes_no_time;

} filler_probe;

trial {

	trial_duration = $response_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text response_text; x=0; y=0; };
	
} response_trial;

trial { 

	trial_duration = $sleep_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text { caption="";}; x=0; y=0; };
	
} sleep;

trial {

	trial_duration = $prompt_sleep_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; text { caption="";}; x=0; y=0; };
		
} prompt_sleep;

trial {
	
	trial_duration = $fixation_duration;
	picture { background_color = $bg_color, $bg_color, $bg_color; line_graphic { 
		coordinates = -100, 0, 100, 0;
		coordinates = 0, -90, 0, 90;
		line_width = 5;
		line_color = $font_color, $font_color, $font_color;
	}; x=0; y=0; };
	
} fixation;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "Great Job! Let's take a break.";
			font = "Times New Roman";
			font_size = $stim_font_size;
		};
		x = 0;
		y = 0;
	};
} break_trial;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "You are done! Thank you for participating.";
			font = "Times New Roman";
			font_size = $stim_font_size;
		};
		x = 0;
		y = 0;
	};
} done_trial;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "Welcome! In this study, we will measure your brain waves as you read different types of sentences.\n\nEach sentence is split into smaller chunks.\n\nYou will read each chunk to yourself as they appear on the screen one-by-one.\n\nYou will also answer questions about some of the sentences. The questions can be answered with “YES” or “NO”.\n\nPress the LEFT button for “YES”\nPress the RIGHT button for “NO”";
			font = "Times New Roman";
			font_size = $instruction_font_size;
		};
		x = 0;
		y = 0;
	};
} instr1;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "Let’s do some practice!\n\nRemember to read each sentence chunk carefully.\n\nWhen you see a question, answer by pressing the LEFT button for “YES” and the RIGHT button for “NO”.";
			font = "Times New Roman";
			font_size = $instruction_font_size;
		};
		x = 0;
		y = 0;
	};
} instr2;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture {
		background_color = $bg_color, $bg_color, $bg_color;
		text 
		{
			font_color = $font_color, $font_color, $font_color;
			background_color = $bg_color, $bg_color, $bg_color;
			caption = "Great Job! Let’s begin the task.\n\nRemember to read each sentence chunk carefully,\nand answer the questions by pressing the LEFT button for “YES” and the RIGHT button for “NO”.\n\nPlease let the experimenter know if you have any questions.
";
			font = "Times New Roman";
			font_size = $instruction_font_size;
		};
		x = 0;
		y = 0;
	};
} instr3;

text {
	font_color = $font_color, $font_color, $font_color;
	background_color = $bg_color, $bg_color, $bg_color;
	caption = "";
	font = "Times New Roman";
	font_size = $instruction_font_size;
} debug_text;

trial {
	trial_duration = 3000;
	picture { 
		background_color = $bg_color, $bg_color, $bg_color;
		text debug_text; x=0; y=0;
	};
} debug;
