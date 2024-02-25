-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 17
entity device_in_0CLK_50065acf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_50065acf;
architecture arch of device_in_0CLK_50065acf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l500_c11_5df6]
signal BIN_OP_AND_uxn_device_h_l500_c11_5df6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l500_c11_5df6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l502_c6_655b]
signal BIN_OP_EQ_uxn_device_h_l502_c6_655b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l502_c6_655b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l502_c1_1a87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c7_6ff7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l502_c2_0639]
signal result_MUX_uxn_device_h_l502_c2_0639_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l502_c2_0639_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l502_c2_0639_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l502_c2_0639_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l503_c12_ff05]
signal system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l503_c12_ff05_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l503_c12_ff05_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l503_c12_ff05_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l505_c11_3499]
signal BIN_OP_EQ_uxn_device_h_l505_c11_3499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l505_c11_3499_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c1_1b5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_8c49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l505_c7_6ff7]
signal result_MUX_uxn_device_h_l505_c7_6ff7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l505_c7_6ff7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l505_c7_6ff7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l505_c7_6ff7_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l506_c12_4121]
signal screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l506_c12_4121_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l506_c12_4121_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l506_c12_4121_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l508_c11_f96b]
signal BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c1_9ff6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l511_c1_824b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l508_c7_8c49]
signal result_MUX_uxn_device_h_l508_c7_8c49_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l508_c7_8c49_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_8c49_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_8c49_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l509_c12_5730]
signal controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l509_c12_5730_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l509_c12_5730_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l509_c12_5730_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l512_c12_2fb2]
signal generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l512_c12_2fb2_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l512_c12_2fb2_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l512_c12_2fb2_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l500_c11_5df6
BIN_OP_AND_uxn_device_h_l500_c11_5df6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l500_c11_5df6_left,
BIN_OP_AND_uxn_device_h_l500_c11_5df6_right,
BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output);

-- BIN_OP_EQ_uxn_device_h_l502_c6_655b
BIN_OP_EQ_uxn_device_h_l502_c6_655b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l502_c6_655b_left,
BIN_OP_EQ_uxn_device_h_l502_c6_655b_right,
BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output);

-- result_MUX_uxn_device_h_l502_c2_0639
result_MUX_uxn_device_h_l502_c2_0639 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l502_c2_0639_cond,
result_MUX_uxn_device_h_l502_c2_0639_iftrue,
result_MUX_uxn_device_h_l502_c2_0639_iffalse,
result_MUX_uxn_device_h_l502_c2_0639_return_output);

-- system_dei_uxn_device_h_l503_c12_ff05
system_dei_uxn_device_h_l503_c12_ff05 : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE,
system_dei_uxn_device_h_l503_c12_ff05_device_address,
system_dei_uxn_device_h_l503_c12_ff05_phase,
system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read,
system_dei_uxn_device_h_l503_c12_ff05_return_output);

-- BIN_OP_EQ_uxn_device_h_l505_c11_3499
BIN_OP_EQ_uxn_device_h_l505_c11_3499 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l505_c11_3499_left,
BIN_OP_EQ_uxn_device_h_l505_c11_3499_right,
BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output);

-- result_MUX_uxn_device_h_l505_c7_6ff7
result_MUX_uxn_device_h_l505_c7_6ff7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l505_c7_6ff7_cond,
result_MUX_uxn_device_h_l505_c7_6ff7_iftrue,
result_MUX_uxn_device_h_l505_c7_6ff7_iffalse,
result_MUX_uxn_device_h_l505_c7_6ff7_return_output);

-- screen_dei_uxn_device_h_l506_c12_4121
screen_dei_uxn_device_h_l506_c12_4121 : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE,
screen_dei_uxn_device_h_l506_c12_4121_device_address,
screen_dei_uxn_device_h_l506_c12_4121_phase,
screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read,
screen_dei_uxn_device_h_l506_c12_4121_return_output);

-- BIN_OP_EQ_uxn_device_h_l508_c11_f96b
BIN_OP_EQ_uxn_device_h_l508_c11_f96b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left,
BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right,
BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output);

-- result_MUX_uxn_device_h_l508_c7_8c49
result_MUX_uxn_device_h_l508_c7_8c49 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l508_c7_8c49_cond,
result_MUX_uxn_device_h_l508_c7_8c49_iftrue,
result_MUX_uxn_device_h_l508_c7_8c49_iffalse,
result_MUX_uxn_device_h_l508_c7_8c49_return_output);

-- controller_dei_uxn_device_h_l509_c12_5730
controller_dei_uxn_device_h_l509_c12_5730 : entity work.controller_dei_0CLK_b6e68f82 port map (
clk,
controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE,
controller_dei_uxn_device_h_l509_c12_5730_device_address,
controller_dei_uxn_device_h_l509_c12_5730_phase,
controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons,
controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read,
controller_dei_uxn_device_h_l509_c12_5730_return_output);

-- generic_dei_uxn_device_h_l512_c12_2fb2
generic_dei_uxn_device_h_l512_c12_2fb2 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE,
generic_dei_uxn_device_h_l512_c12_2fb2_device_address,
generic_dei_uxn_device_h_l512_c12_2fb2_phase,
generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read,
generic_dei_uxn_device_h_l512_c12_2fb2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output,
 BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output,
 result_MUX_uxn_device_h_l502_c2_0639_return_output,
 system_dei_uxn_device_h_l503_c12_ff05_return_output,
 BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output,
 result_MUX_uxn_device_h_l505_c7_6ff7_return_output,
 screen_dei_uxn_device_h_l506_c12_4121_return_output,
 BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output,
 result_MUX_uxn_device_h_l508_c7_8c49_return_output,
 controller_dei_uxn_device_h_l509_c12_5730_return_output,
 generic_dei_uxn_device_h_l512_c12_2fb2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l502_c2_0639_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_0639_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_6ff7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_0639_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l502_c2_0639_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l503_c12_ff05_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l503_c12_ff05_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l503_c12_ff05_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_8c49_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_6ff7_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l506_c12_4121_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l506_c12_4121_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l506_c12_4121_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l508_c7_8c49_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_8c49_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_8c49_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l509_c12_5730_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l512_c12_2fb2_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l512_c12_2fb2_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l512_c12_2fb2_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_right := to_unsigned(240, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l509_c12_5730_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l512_c12_2fb2_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l506_c12_4121_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l503_c12_ff05_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l509_c12_5730_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l512_c12_2fb2_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l506_c12_4121_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l503_c12_ff05_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l500_c11_5df6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l500_c11_5df6_left <= VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_left;
     BIN_OP_AND_uxn_device_h_l500_c11_5df6_right <= VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output := BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_left := VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_left := VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left := VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l500_c11_5df6_return_output;
     -- BIN_OP_EQ[uxn_device_h_l502_c6_655b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l502_c6_655b_left <= VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_left;
     BIN_OP_EQ_uxn_device_h_l502_c6_655b_right <= VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output := BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l508_c11_f96b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_left;
     BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output := BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l505_c11_3499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l505_c11_3499_left <= VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_left;
     BIN_OP_EQ_uxn_device_h_l505_c11_3499_right <= VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output := BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond := VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output;
     VAR_result_MUX_uxn_device_h_l502_c2_0639_cond := VAR_BIN_OP_EQ_uxn_device_h_l502_c6_655b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output;
     VAR_result_MUX_uxn_device_h_l505_c7_6ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l505_c11_3499_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_8c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_f96b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l502_c1_1a87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c7_6ff7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_6ff7_return_output;
     VAR_system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l502_c1_1a87_return_output;
     -- system_dei[uxn_device_h_l503_c12_ff05] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l503_c12_ff05_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l503_c12_ff05_device_address <= VAR_system_dei_uxn_device_h_l503_c12_ff05_device_address;
     system_dei_uxn_device_h_l503_c12_ff05_phase <= VAR_system_dei_uxn_device_h_l503_c12_ff05_phase;
     system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l503_c12_ff05_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l503_c12_ff05_return_output := system_dei_uxn_device_h_l503_c12_ff05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c1_1b5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_8c49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_8c49_return_output;
     VAR_screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c1_1b5c_return_output;
     VAR_result_MUX_uxn_device_h_l502_c2_0639_iftrue := VAR_system_dei_uxn_device_h_l503_c12_ff05_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c1_9ff6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l511_c1_824b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output;

     -- screen_dei[uxn_device_h_l506_c12_4121] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l506_c12_4121_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l506_c12_4121_device_address <= VAR_screen_dei_uxn_device_h_l506_c12_4121_device_address;
     screen_dei_uxn_device_h_l506_c12_4121_phase <= VAR_screen_dei_uxn_device_h_l506_c12_4121_phase;
     screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l506_c12_4121_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l506_c12_4121_return_output := screen_dei_uxn_device_h_l506_c12_4121_return_output;

     -- Submodule level 5
     VAR_generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l511_c1_824b_return_output;
     VAR_controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c1_9ff6_return_output;
     VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iftrue := VAR_screen_dei_uxn_device_h_l506_c12_4121_return_output;
     -- generic_dei[uxn_device_h_l512_c12_2fb2] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l512_c12_2fb2_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l512_c12_2fb2_device_address <= VAR_generic_dei_uxn_device_h_l512_c12_2fb2_device_address;
     generic_dei_uxn_device_h_l512_c12_2fb2_phase <= VAR_generic_dei_uxn_device_h_l512_c12_2fb2_phase;
     generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l512_c12_2fb2_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l512_c12_2fb2_return_output := generic_dei_uxn_device_h_l512_c12_2fb2_return_output;

     -- controller_dei[uxn_device_h_l509_c12_5730] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l509_c12_5730_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l509_c12_5730_device_address <= VAR_controller_dei_uxn_device_h_l509_c12_5730_device_address;
     controller_dei_uxn_device_h_l509_c12_5730_phase <= VAR_controller_dei_uxn_device_h_l509_c12_5730_phase;
     controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons <= VAR_controller_dei_uxn_device_h_l509_c12_5730_controller0_buttons;
     controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l509_c12_5730_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l509_c12_5730_return_output := controller_dei_uxn_device_h_l509_c12_5730_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l508_c7_8c49_iftrue := VAR_controller_dei_uxn_device_h_l509_c12_5730_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_8c49_iffalse := VAR_generic_dei_uxn_device_h_l512_c12_2fb2_return_output;
     -- result_MUX[uxn_device_h_l508_c7_8c49] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l508_c7_8c49_cond <= VAR_result_MUX_uxn_device_h_l508_c7_8c49_cond;
     result_MUX_uxn_device_h_l508_c7_8c49_iftrue <= VAR_result_MUX_uxn_device_h_l508_c7_8c49_iftrue;
     result_MUX_uxn_device_h_l508_c7_8c49_iffalse <= VAR_result_MUX_uxn_device_h_l508_c7_8c49_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l508_c7_8c49_return_output := result_MUX_uxn_device_h_l508_c7_8c49_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iffalse := VAR_result_MUX_uxn_device_h_l508_c7_8c49_return_output;
     -- result_MUX[uxn_device_h_l505_c7_6ff7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l505_c7_6ff7_cond <= VAR_result_MUX_uxn_device_h_l505_c7_6ff7_cond;
     result_MUX_uxn_device_h_l505_c7_6ff7_iftrue <= VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iftrue;
     result_MUX_uxn_device_h_l505_c7_6ff7_iffalse <= VAR_result_MUX_uxn_device_h_l505_c7_6ff7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l505_c7_6ff7_return_output := result_MUX_uxn_device_h_l505_c7_6ff7_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l502_c2_0639_iffalse := VAR_result_MUX_uxn_device_h_l505_c7_6ff7_return_output;
     -- result_MUX[uxn_device_h_l502_c2_0639] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l502_c2_0639_cond <= VAR_result_MUX_uxn_device_h_l502_c2_0639_cond;
     result_MUX_uxn_device_h_l502_c2_0639_iftrue <= VAR_result_MUX_uxn_device_h_l502_c2_0639_iftrue;
     result_MUX_uxn_device_h_l502_c2_0639_iffalse <= VAR_result_MUX_uxn_device_h_l502_c2_0639_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l502_c2_0639_return_output := result_MUX_uxn_device_h_l502_c2_0639_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l502_c2_0639_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l502_c2_0639_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
