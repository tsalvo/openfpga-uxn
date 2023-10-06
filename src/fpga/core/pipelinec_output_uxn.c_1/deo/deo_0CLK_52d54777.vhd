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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l565_c6_ac1d]
signal BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c1_07fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_d07a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l565_c2_5bec]
signal t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l565_c2_5bec]
signal n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l565_c2_5bec]
signal device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : device_out_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l565_c2_5bec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l566_c3_cb79[uxn_opcodes_h_l566_c3_cb79]
signal printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_9b92]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l571_c7_d07a]
signal t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l571_c7_d07a]
signal n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l571_c7_d07a]
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : device_out_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l571_c7_d07a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_615a]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_5dab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : device_out_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l574_c7_b1e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_e2e9]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l578_c7_5dab]
signal n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l578_c7_5dab]
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : device_out_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l578_c7_5dab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_04d6]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c1_27fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : device_out_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(1 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l581_c7_b6c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l585_c32_76ed]
signal BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l585_c32_ad9e]
signal BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l585_c32_ef58]
signal MUX_uxn_opcodes_h_l585_c32_ef58_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c32_ef58_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l585_c32_ef58_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l585_c32_ef58_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l589_c42_fde3]
signal BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l589_c23_1914]
signal device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l589_c23_1914_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l589_c23_1914_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l589_c23_1914_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l589_c23_1914_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_30c0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.device_ram_value := ref_toks_8;
      base.vram_address := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.is_device_ram_write := ref_toks_11;
      base.is_stack_read := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d
BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left,
BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right,
BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- t8_MUX_uxn_opcodes_h_l565_c2_5bec
t8_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- n8_MUX_uxn_opcodes_h_l565_c2_5bec
n8_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec
device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec
result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec
result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec
result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec
result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec
result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

-- printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79
printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79 : entity work.printf_uxn_opcodes_h_l566_c3_cb79_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c7_d07a
t8_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- n8_MUX_uxn_opcodes_h_l571_c7_d07a
n8_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a
device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a
result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a
result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a
result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a
BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_b1e1
t8_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_b1e1
n8_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1
device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1
result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1
result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1
result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9
BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- n8_MUX_uxn_opcodes_h_l578_c7_5dab
n8_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab
device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab
result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab
result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab
result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6
BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output);

-- n8_MUX_uxn_opcodes_h_l581_c7_b6c2
n8_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2
device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2
result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2
result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2
result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed
BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left,
BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right,
BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e
BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left,
BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right,
BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output);

-- MUX_uxn_opcodes_h_l585_c32_ef58
MUX_uxn_opcodes_h_l585_c32_ef58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c32_ef58_cond,
MUX_uxn_opcodes_h_l585_c32_ef58_iftrue,
MUX_uxn_opcodes_h_l585_c32_ef58_iffalse,
MUX_uxn_opcodes_h_l585_c32_ef58_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3
BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left,
BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right,
BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output);

-- device_out_uxn_opcodes_h_l589_c23_1914
device_out_uxn_opcodes_h_l589_c23_1914 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l589_c23_1914_device_address,
device_out_uxn_opcodes_h_l589_c23_1914_value,
device_out_uxn_opcodes_h_l589_c23_1914_phase,
device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read,
device_out_uxn_opcodes_h_l589_c23_1914_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output,
 n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output,
 BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output,
 MUX_uxn_opcodes_h_l585_c32_ef58_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output,
 device_out_uxn_opcodes_h_l589_c23_1914_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_47e1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_6a6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_998e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5869 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_5dab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c32_ef58_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c32_ef58_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l590_c32_a607_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l591_c31_e9d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l592_c31_667b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l593_c29_2bbe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_1e4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l595_c25_75c7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l596_c23_93ad_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l597_c24_4349_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30c0_uxn_opcodes_h_l600_l560_DUPLICATE_7cde_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_998e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_998e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_47e1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_47e1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5869 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5869;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_6a6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_6a6a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right := to_unsigned(128, 8);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_9b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l585_c32_76ed] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output := result.device_ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_5dab_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_e2e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l589_c42_fde3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_04d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l565_c6_ac1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_615a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l585_c32_76ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c6_ac1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9b92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_615a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_e2e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_04d6_return_output;
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l589_c42_fde3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_8307_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_2024_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_f665_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l574_l565_l578_l571_DUPLICATE_2f24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l574_l581_l578_l571_DUPLICATE_286c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_c04b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9c89_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_7bfb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_dc56_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l565_l578_l581_l574_l571_DUPLICATE_9b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_5dab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c1_07fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l585_c32_ad9e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_left;
     BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output := BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l585_c32_ef58_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l585_c32_ad9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c1_07fb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- MUX[uxn_opcodes_h_l585_c32_ef58] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c32_ef58_cond <= VAR_MUX_uxn_opcodes_h_l585_c32_ef58_cond;
     MUX_uxn_opcodes_h_l585_c32_ef58_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iftrue;
     MUX_uxn_opcodes_h_l585_c32_ef58_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c32_ef58_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c32_ef58_return_output := MUX_uxn_opcodes_h_l585_c32_ef58_return_output;

     -- n8_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- printf_uxn_opcodes_h_l566_c3_cb79[uxn_opcodes_h_l566_c3_cb79] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l566_c3_cb79_uxn_opcodes_h_l566_c3_cb79_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue := VAR_MUX_uxn_opcodes_h_l585_c32_ef58_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- n8_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c1_27fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c1_27fe_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     -- device_out[uxn_opcodes_h_l589_c23_1914] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l589_c23_1914_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l589_c23_1914_device_address <= VAR_device_out_uxn_opcodes_h_l589_c23_1914_device_address;
     device_out_uxn_opcodes_h_l589_c23_1914_value <= VAR_device_out_uxn_opcodes_h_l589_c23_1914_value;
     device_out_uxn_opcodes_h_l589_c23_1914_phase <= VAR_device_out_uxn_opcodes_h_l589_c23_1914_phase;
     device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l589_c23_1914_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output := device_out_uxn_opcodes_h_l589_c23_1914_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l591_c31_e9d3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l591_c31_e9d3_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l590_c32_a607] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l590_c32_a607_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l594_c26_1e4c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_1e4c_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l593_c29_2bbe] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l593_c29_2bbe_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.device_ram_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l595_c25_75c7] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l595_c25_75c7_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l592_c31_667b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l592_c31_667b_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l596_c23_93ad] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l596_c23_93ad_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.vram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l597_c24_4349] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l597_c24_4349_return_output := VAR_device_out_uxn_opcodes_h_l589_c23_1914_return_output.is_deo_done;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l597_c24_4349_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l591_c31_e9d3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l590_c32_a607_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_1e4c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l596_c23_93ad_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l595_c25_75c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l592_c31_667b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l593_c29_2bbe_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_b6c2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l581_c7_b6c2_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_5dab] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l578_c7_5dab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l574_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l574_c7_b1e1_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_d07a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l571_c7_d07a_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l565_c2_5bec] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_30c0_uxn_opcodes_h_l600_l560_DUPLICATE_7cde LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30c0_uxn_opcodes_h_l600_l560_DUPLICATE_7cde_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_30c0(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c2_5bec_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c2_5bec_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30c0_uxn_opcodes_h_l600_l560_DUPLICATE_7cde_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30c0_uxn_opcodes_h_l600_l560_DUPLICATE_7cde_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
