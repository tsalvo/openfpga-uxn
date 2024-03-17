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
-- Submodules: 22
entity device_in_0CLK_c062f1e5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 stack_ptr0 : in unsigned(7 downto 0);
 stack_ptr1 : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_c062f1e5;
architecture arch of device_in_0CLK_c062f1e5 is
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
-- BIN_OP_AND[uxn_device_h_l606_c11_eb1c]
signal BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l608_c6_2210]
signal BIN_OP_EQ_uxn_device_h_l608_c6_2210_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l608_c6_2210_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l608_c1_f7d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c7_986f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l608_c2_f44e]
signal result_MUX_uxn_device_h_l608_c2_f44e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l608_c2_f44e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l608_c2_f44e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l608_c2_f44e_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l609_c12_a268]
signal system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_stack_ptr0 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_stack_ptr1 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_a268_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l611_c11_23dd]
signal BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_ea0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_c46c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l611_c7_986f]
signal result_MUX_uxn_device_h_l611_c7_986f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l611_c7_986f_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c7_986f_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c7_986f_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l612_c12_6ae7]
signal screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l612_c12_6ae7_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_6ae7_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_6ae7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l614_c11_9ec3]
signal BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_273c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_674e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l614_c7_c46c]
signal result_MUX_uxn_device_h_l614_c7_c46c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l614_c7_c46c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_c46c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_c46c_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l615_c12_6f7b]
signal controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l615_c12_6f7b_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_6f7b_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_6f7b_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l617_c11_12ef]
signal BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_b6fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_7767]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l617_c7_674e]
signal result_MUX_uxn_device_h_l617_c7_674e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l617_c7_674e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_674e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_674e_return_output : device_in_result_t;

-- datetime_dei[uxn_device_h_l618_c12_7290]
signal datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_7290_device_address : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_7290_phase : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_7290_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l621_c12_496b]
signal generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l621_c12_496b_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_496b_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_496b_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l606_c11_eb1c
BIN_OP_AND_uxn_device_h_l606_c11_eb1c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left,
BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right,
BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output);

-- BIN_OP_EQ_uxn_device_h_l608_c6_2210
BIN_OP_EQ_uxn_device_h_l608_c6_2210 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l608_c6_2210_left,
BIN_OP_EQ_uxn_device_h_l608_c6_2210_right,
BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output);

-- result_MUX_uxn_device_h_l608_c2_f44e
result_MUX_uxn_device_h_l608_c2_f44e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l608_c2_f44e_cond,
result_MUX_uxn_device_h_l608_c2_f44e_iftrue,
result_MUX_uxn_device_h_l608_c2_f44e_iffalse,
result_MUX_uxn_device_h_l608_c2_f44e_return_output);

-- system_dei_uxn_device_h_l609_c12_a268
system_dei_uxn_device_h_l609_c12_a268 : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE,
system_dei_uxn_device_h_l609_c12_a268_device_address,
system_dei_uxn_device_h_l609_c12_a268_phase,
system_dei_uxn_device_h_l609_c12_a268_stack_ptr0,
system_dei_uxn_device_h_l609_c12_a268_stack_ptr1,
system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read,
system_dei_uxn_device_h_l609_c12_a268_return_output);

-- BIN_OP_EQ_uxn_device_h_l611_c11_23dd
BIN_OP_EQ_uxn_device_h_l611_c11_23dd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left,
BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right,
BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output);

-- result_MUX_uxn_device_h_l611_c7_986f
result_MUX_uxn_device_h_l611_c7_986f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l611_c7_986f_cond,
result_MUX_uxn_device_h_l611_c7_986f_iftrue,
result_MUX_uxn_device_h_l611_c7_986f_iffalse,
result_MUX_uxn_device_h_l611_c7_986f_return_output);

-- screen_dei_uxn_device_h_l612_c12_6ae7
screen_dei_uxn_device_h_l612_c12_6ae7 : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE,
screen_dei_uxn_device_h_l612_c12_6ae7_device_address,
screen_dei_uxn_device_h_l612_c12_6ae7_phase,
screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read,
screen_dei_uxn_device_h_l612_c12_6ae7_return_output);

-- BIN_OP_EQ_uxn_device_h_l614_c11_9ec3
BIN_OP_EQ_uxn_device_h_l614_c11_9ec3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left,
BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right,
BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output);

-- result_MUX_uxn_device_h_l614_c7_c46c
result_MUX_uxn_device_h_l614_c7_c46c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l614_c7_c46c_cond,
result_MUX_uxn_device_h_l614_c7_c46c_iftrue,
result_MUX_uxn_device_h_l614_c7_c46c_iffalse,
result_MUX_uxn_device_h_l614_c7_c46c_return_output);

-- controller_dei_uxn_device_h_l615_c12_6f7b
controller_dei_uxn_device_h_l615_c12_6f7b : entity work.controller_dei_0CLK_336c9a77 port map (
clk,
controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE,
controller_dei_uxn_device_h_l615_c12_6f7b_device_address,
controller_dei_uxn_device_h_l615_c12_6f7b_phase,
controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons,
controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read,
controller_dei_uxn_device_h_l615_c12_6f7b_return_output);

-- BIN_OP_EQ_uxn_device_h_l617_c11_12ef
BIN_OP_EQ_uxn_device_h_l617_c11_12ef : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left,
BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right,
BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output);

-- result_MUX_uxn_device_h_l617_c7_674e
result_MUX_uxn_device_h_l617_c7_674e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l617_c7_674e_cond,
result_MUX_uxn_device_h_l617_c7_674e_iftrue,
result_MUX_uxn_device_h_l617_c7_674e_iffalse,
result_MUX_uxn_device_h_l617_c7_674e_return_output);

-- datetime_dei_uxn_device_h_l618_c12_7290
datetime_dei_uxn_device_h_l618_c12_7290 : entity work.datetime_dei_0CLK_24541ec2 port map (
clk,
datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l618_c12_7290_device_address,
datetime_dei_uxn_device_h_l618_c12_7290_phase,
datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read,
datetime_dei_uxn_device_h_l618_c12_7290_return_output);

-- generic_dei_uxn_device_h_l621_c12_496b
generic_dei_uxn_device_h_l621_c12_496b : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE,
generic_dei_uxn_device_h_l621_c12_496b_device_address,
generic_dei_uxn_device_h_l621_c12_496b_phase,
generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read,
generic_dei_uxn_device_h_l621_c12_496b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 stack_ptr0,
 stack_ptr1,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output,
 BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output,
 result_MUX_uxn_device_h_l608_c2_f44e_return_output,
 system_dei_uxn_device_h_l609_c12_a268_return_output,
 BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output,
 result_MUX_uxn_device_h_l611_c7_986f_return_output,
 screen_dei_uxn_device_h_l612_c12_6ae7_return_output,
 BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output,
 result_MUX_uxn_device_h_l614_c7_c46c_return_output,
 controller_dei_uxn_device_h_l615_c12_6f7b_return_output,
 BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output,
 result_MUX_uxn_device_h_l617_c7_674e_return_output,
 datetime_dei_uxn_device_h_l618_c12_7290_return_output,
 generic_dei_uxn_device_h_l621_c12_496b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l608_c2_f44e_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_f44e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_986f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_f44e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_f44e_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_a268_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l611_c7_986f_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_986f_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_c46c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_986f_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_6ae7_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_6ae7_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_6ae7_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l614_c7_c46c_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_c46c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_674e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_c46c_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_6f7b_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l617_c7_674e_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_674e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_674e_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_7290_device_address : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_7290_phase : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_7290_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l621_c12_496b_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_496b_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_496b_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right := to_unsigned(192, 8);

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
     VAR_stack_ptr0 := stack_ptr0;
     VAR_stack_ptr1 := stack_ptr1;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_device_address := VAR_device_address;
     VAR_datetime_dei_uxn_device_h_l618_c12_7290_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l621_c12_496b_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l612_c12_6ae7_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l609_c12_a268_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_phase := VAR_phase;
     VAR_datetime_dei_uxn_device_h_l618_c12_7290_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l621_c12_496b_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l612_c12_6ae7_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l609_c12_a268_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr0 := VAR_stack_ptr0;
     VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr1 := VAR_stack_ptr1;
     -- BIN_OP_AND[uxn_device_h_l606_c11_eb1c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left <= VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_left;
     BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right <= VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output := BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l606_c11_eb1c_return_output;
     -- BIN_OP_EQ[uxn_device_h_l614_c11_9ec3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_left;
     BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output := BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l617_c11_12ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_left;
     BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output := BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output;

     -- BIN_OP_EQ[uxn_device_h_l611_c11_23dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_left;
     BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output := BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l608_c6_2210] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l608_c6_2210_left <= VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_left;
     BIN_OP_EQ_uxn_device_h_l608_c6_2210_right <= VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output := BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output;
     VAR_result_MUX_uxn_device_h_l608_c2_f44e_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_2210_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output;
     VAR_result_MUX_uxn_device_h_l611_c7_986f_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_23dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_c46c_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_9ec3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_674e_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_12ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l608_c1_f7d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c7_986f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_986f_return_output;
     VAR_system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_f7d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_c46c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_ea0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output;

     -- system_dei[uxn_device_h_l609_c12_a268] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l609_c12_a268_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l609_c12_a268_device_address <= VAR_system_dei_uxn_device_h_l609_c12_a268_device_address;
     system_dei_uxn_device_h_l609_c12_a268_phase <= VAR_system_dei_uxn_device_h_l609_c12_a268_phase;
     system_dei_uxn_device_h_l609_c12_a268_stack_ptr0 <= VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr0;
     system_dei_uxn_device_h_l609_c12_a268_stack_ptr1 <= VAR_system_dei_uxn_device_h_l609_c12_a268_stack_ptr1;
     system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l609_c12_a268_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l609_c12_a268_return_output := system_dei_uxn_device_h_l609_c12_a268_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_c46c_return_output;
     VAR_screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_ea0c_return_output;
     VAR_result_MUX_uxn_device_h_l608_c2_f44e_iftrue := VAR_system_dei_uxn_device_h_l609_c12_a268_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_273c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_674e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output;

     -- screen_dei[uxn_device_h_l612_c12_6ae7] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l612_c12_6ae7_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l612_c12_6ae7_device_address <= VAR_screen_dei_uxn_device_h_l612_c12_6ae7_device_address;
     screen_dei_uxn_device_h_l612_c12_6ae7_phase <= VAR_screen_dei_uxn_device_h_l612_c12_6ae7_phase;
     screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l612_c12_6ae7_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l612_c12_6ae7_return_output := screen_dei_uxn_device_h_l612_c12_6ae7_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_674e_return_output;
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_273c_return_output;
     VAR_result_MUX_uxn_device_h_l611_c7_986f_iftrue := VAR_screen_dei_uxn_device_h_l612_c12_6ae7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_7767] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output;

     -- controller_dei[uxn_device_h_l615_c12_6f7b] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l615_c12_6f7b_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l615_c12_6f7b_device_address <= VAR_controller_dei_uxn_device_h_l615_c12_6f7b_device_address;
     controller_dei_uxn_device_h_l615_c12_6f7b_phase <= VAR_controller_dei_uxn_device_h_l615_c12_6f7b_phase;
     controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons <= VAR_controller_dei_uxn_device_h_l615_c12_6f7b_controller0_buttons;
     controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l615_c12_6f7b_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l615_c12_6f7b_return_output := controller_dei_uxn_device_h_l615_c12_6f7b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_b6fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_7767_return_output;
     VAR_datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_b6fb_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_c46c_iftrue := VAR_controller_dei_uxn_device_h_l615_c12_6f7b_return_output;
     -- datetime_dei[uxn_device_h_l618_c12_7290] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l618_c12_7290_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l618_c12_7290_device_address <= VAR_datetime_dei_uxn_device_h_l618_c12_7290_device_address;
     datetime_dei_uxn_device_h_l618_c12_7290_phase <= VAR_datetime_dei_uxn_device_h_l618_c12_7290_phase;
     datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read <= VAR_datetime_dei_uxn_device_h_l618_c12_7290_previous_device_ram_read;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l618_c12_7290_return_output := datetime_dei_uxn_device_h_l618_c12_7290_return_output;

     -- generic_dei[uxn_device_h_l621_c12_496b] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l621_c12_496b_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l621_c12_496b_device_address <= VAR_generic_dei_uxn_device_h_l621_c12_496b_device_address;
     generic_dei_uxn_device_h_l621_c12_496b_phase <= VAR_generic_dei_uxn_device_h_l621_c12_496b_phase;
     generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l621_c12_496b_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l621_c12_496b_return_output := generic_dei_uxn_device_h_l621_c12_496b_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l617_c7_674e_iftrue := VAR_datetime_dei_uxn_device_h_l618_c12_7290_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_674e_iffalse := VAR_generic_dei_uxn_device_h_l621_c12_496b_return_output;
     -- result_MUX[uxn_device_h_l617_c7_674e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l617_c7_674e_cond <= VAR_result_MUX_uxn_device_h_l617_c7_674e_cond;
     result_MUX_uxn_device_h_l617_c7_674e_iftrue <= VAR_result_MUX_uxn_device_h_l617_c7_674e_iftrue;
     result_MUX_uxn_device_h_l617_c7_674e_iffalse <= VAR_result_MUX_uxn_device_h_l617_c7_674e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l617_c7_674e_return_output := result_MUX_uxn_device_h_l617_c7_674e_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l614_c7_c46c_iffalse := VAR_result_MUX_uxn_device_h_l617_c7_674e_return_output;
     -- result_MUX[uxn_device_h_l614_c7_c46c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l614_c7_c46c_cond <= VAR_result_MUX_uxn_device_h_l614_c7_c46c_cond;
     result_MUX_uxn_device_h_l614_c7_c46c_iftrue <= VAR_result_MUX_uxn_device_h_l614_c7_c46c_iftrue;
     result_MUX_uxn_device_h_l614_c7_c46c_iffalse <= VAR_result_MUX_uxn_device_h_l614_c7_c46c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l614_c7_c46c_return_output := result_MUX_uxn_device_h_l614_c7_c46c_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l611_c7_986f_iffalse := VAR_result_MUX_uxn_device_h_l614_c7_c46c_return_output;
     -- result_MUX[uxn_device_h_l611_c7_986f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l611_c7_986f_cond <= VAR_result_MUX_uxn_device_h_l611_c7_986f_cond;
     result_MUX_uxn_device_h_l611_c7_986f_iftrue <= VAR_result_MUX_uxn_device_h_l611_c7_986f_iftrue;
     result_MUX_uxn_device_h_l611_c7_986f_iffalse <= VAR_result_MUX_uxn_device_h_l611_c7_986f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l611_c7_986f_return_output := result_MUX_uxn_device_h_l611_c7_986f_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l608_c2_f44e_iffalse := VAR_result_MUX_uxn_device_h_l611_c7_986f_return_output;
     -- result_MUX[uxn_device_h_l608_c2_f44e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l608_c2_f44e_cond <= VAR_result_MUX_uxn_device_h_l608_c2_f44e_cond;
     result_MUX_uxn_device_h_l608_c2_f44e_iftrue <= VAR_result_MUX_uxn_device_h_l608_c2_f44e_iftrue;
     result_MUX_uxn_device_h_l608_c2_f44e_iffalse <= VAR_result_MUX_uxn_device_h_l608_c2_f44e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l608_c2_f44e_return_output := result_MUX_uxn_device_h_l608_c2_f44e_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l608_c2_f44e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l608_c2_f44e_return_output;
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
