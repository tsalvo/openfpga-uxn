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
-- Submodules: 96
entity deo_0CLK_aef2f46d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_aef2f46d;
architecture arch of deo_0CLK_aef2f46d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l408_c6_db75]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_e9e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l408_c2_1e81]
signal n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l408_c2_1e81]
signal t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l408_c2_1e81]
signal device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : device_out_result_t;

-- result_is_vram_write_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l408_c2_1e81]
signal result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l409_c3_d5e7[uxn_opcodes_h_l409_c3_d5e7]
signal printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l412_c26_e3bf]
signal BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l415_c11_8eed]
signal BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : device_out_result_t;

-- result_is_vram_write_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l415_c7_3b9c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l417_c26_756e]
signal BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l419_c11_240a]
signal BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l424_c7_e04c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : device_out_result_t;

-- result_is_vram_write_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l419_c7_ca5a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l422_c26_26f3]
signal BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l424_c11_dd57]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l424_c7_e04c]
signal n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l424_c7_e04c]
signal device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : device_out_result_t;

-- result_is_vram_write_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l424_c7_e04c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l426_c26_f20f]
signal BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l428_c11_05b1]
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c1_d4d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : device_out_result_t;

-- result_is_vram_write_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(1 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l428_c7_e4aa]
signal result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l431_c16_63b2]
signal BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l431_c35_ac2a]
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l431_c16_c623]
signal MUX_uxn_opcodes_h_l431_c16_c623_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l431_c16_c623_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l431_c16_c623_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l431_c16_c623_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l434_c79_b833]
signal BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l434_c3_0613[uxn_opcodes_h_l434_c3_0613]
signal printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l436_c42_da99]
signal BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l436_c23_365b]
signal device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l436_c23_365b_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l436_c23_365b_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l436_c23_365b_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l436_c23_365b_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_745e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
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
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.vram_address := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.stack_address := ref_toks_10;
      base.is_sp_updated := ref_toks_11;
      base.sp := ref_toks_12;
      base.device_ram_value := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75
BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- n8_MUX_uxn_opcodes_h_l408_c2_1e81
n8_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- t8_MUX_uxn_opcodes_h_l408_c2_1e81
t8_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81
device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81
result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81
result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81
result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81
result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81
result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_sp_MUX_uxn_opcodes_h_l408_c2_1e81
result_sp_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81
result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

-- printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7
printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7 : entity work.printf_uxn_opcodes_h_l409_c3_d5e7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE);

-- BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf
BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left,
BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right,
BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed
BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left,
BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right,
BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- n8_MUX_uxn_opcodes_h_l415_c7_3b9c
n8_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- t8_MUX_uxn_opcodes_h_l415_c7_3b9c
t8_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c
device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c
result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c
result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c
result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c
result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c
result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c
result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c
result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e
BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left,
BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right,
BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a
BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left,
BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right,
BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- n8_MUX_uxn_opcodes_h_l419_c7_ca5a
n8_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- t8_MUX_uxn_opcodes_h_l419_c7_ca5a
t8_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a
device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a
result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a
result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a
result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a
result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a
result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a
result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a
result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3
BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left,
BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right,
BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- n8_MUX_uxn_opcodes_h_l424_c7_e04c
n8_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c
device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c
result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c
result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c
result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c
result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c
result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l424_c7_e04c
result_sp_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c
result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f
BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left,
BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right,
BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1
BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output);

-- n8_MUX_uxn_opcodes_h_l428_c7_e4aa
n8_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa
device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa
result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa
result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa
result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa
result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa
result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa
result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa
result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa
result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa
result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2
BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left,
BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right,
BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a
BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left,
BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right,
BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output);

-- MUX_uxn_opcodes_h_l431_c16_c623
MUX_uxn_opcodes_h_l431_c16_c623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l431_c16_c623_cond,
MUX_uxn_opcodes_h_l431_c16_c623_iftrue,
MUX_uxn_opcodes_h_l431_c16_c623_iffalse,
MUX_uxn_opcodes_h_l431_c16_c623_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833
BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left,
BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right,
BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output);

-- printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613
printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613 : entity work.printf_uxn_opcodes_h_l434_c3_0613_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE,
printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0,
printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1,
printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2);

-- BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99
BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left,
BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right,
BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output);

-- device_out_uxn_opcodes_h_l436_c23_365b
device_out_uxn_opcodes_h_l436_c23_365b : entity work.device_out_0CLK_b72c91ff port map (
clk,
device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l436_c23_365b_device_address,
device_out_uxn_opcodes_h_l436_c23_365b_value,
device_out_uxn_opcodes_h_l436_c23_365b_phase,
device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read,
device_out_uxn_opcodes_h_l436_c23_365b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 ins,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output,
 n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output,
 MUX_uxn_opcodes_h_l431_c16_c623_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output,
 device_out_uxn_opcodes_h_l436_c23_365b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l424_c7_e04c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l431_c16_c623_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l431_c16_c623_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l431_c16_c623_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l431_c16_c623_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2 : unsigned(31 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l437_c32_9998_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l438_c31_d525_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c31_6c80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l440_c29_d5d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l441_c26_36a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l442_c25_764d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l443_c23_5f48_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l444_c24_6018_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l447_l403_DUPLICATE_d986_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right := to_unsigned(5, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right := to_unsigned(5, 3);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := n8;
     VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1 := resize(n8, 32);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left := VAR_sp;
     VAR_MUX_uxn_opcodes_h_l431_c16_c623_iftrue := VAR_sp;
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_device_address := t8;
     VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0 := resize(t8, 32);
     VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := t8;
     -- BIN_OP_MINUS[uxn_opcodes_h_l431_c35_ac2a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l431_c16_63b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_left;
     BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output := BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c6_db75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l415_c11_8eed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_left;
     BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output := BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l424_c7_e04c_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output := result.is_sp_updated;

     -- BIN_OP_MINUS[uxn_opcodes_h_l434_c79_b833] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_left;
     BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output := BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l419_c11_240a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_left;
     BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output := BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l422_c26_26f3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l428_c11_05b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l408_c2_1e81_return_output := result.is_stack_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l417_c26_756e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_left;
     BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output := BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c11_dd57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l436_c42_da99] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_left;
     BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output := BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output := result.is_vram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l412_c26_e3bf] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_left;
     BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output := BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l426_c26_f20f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output;

     -- result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l424_c7_e04c_return_output := result.stack_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output := result.sp;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l431_c16_c623_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l431_c16_63b2_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c6_db75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l415_c11_8eed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l419_c11_240a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dd57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_05b1_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l412_c26_e3bf_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l417_c26_756e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l422_c26_26f3_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l426_c26_f20f_return_output;
     VAR_MUX_uxn_opcodes_h_l431_c16_c623_iffalse := VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c35_ac2a_return_output;
     VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2 := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l434_c79_b833_return_output, 32);
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l436_c42_da99_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_abba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l428_l419_l424_l415_DUPLICATE_912d_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l419_l408_l424_l415_DUPLICATE_5a3b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_33e2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_f8e3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_1e0c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_aa6f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_0f97_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l424_l419_l415_l428_l408_DUPLICATE_a3c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l408_c2_1e81_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l424_c7_e04c_return_output;
     -- MUX[uxn_opcodes_h_l431_c16_c623] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l431_c16_c623_cond <= VAR_MUX_uxn_opcodes_h_l431_c16_c623_cond;
     MUX_uxn_opcodes_h_l431_c16_c623_iftrue <= VAR_MUX_uxn_opcodes_h_l431_c16_c623_iftrue;
     MUX_uxn_opcodes_h_l431_c16_c623_iffalse <= VAR_MUX_uxn_opcodes_h_l431_c16_c623_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l431_c16_c623_return_output := MUX_uxn_opcodes_h_l431_c16_c623_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- t8_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- n8_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l408_c1_e9e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue := VAR_MUX_uxn_opcodes_h_l431_c16_c623_return_output;
     VAR_printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l408_c1_e9e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- printf_uxn_opcodes_h_l409_c3_d5e7[uxn_opcodes_h_l409_c3_d5e7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l409_c3_d5e7_uxn_opcodes_h_l409_c3_d5e7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- t8_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_t8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- n8_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- t8_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;
     -- result_sp_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_n8_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l433_c1_d4d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- n8_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output;
     VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l433_c1_d4d7_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     -- printf_uxn_opcodes_h_l434_c3_0613[uxn_opcodes_h_l434_c3_0613] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0 <= VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg0;
     printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1 <= VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg1;
     printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2 <= VAR_printf_uxn_opcodes_h_l434_c3_0613_uxn_opcodes_h_l434_c3_0613_arg2;
     -- Outputs

     -- result_sp_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- device_out[uxn_opcodes_h_l436_c23_365b] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l436_c23_365b_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l436_c23_365b_device_address <= VAR_device_out_uxn_opcodes_h_l436_c23_365b_device_address;
     device_out_uxn_opcodes_h_l436_c23_365b_value <= VAR_device_out_uxn_opcodes_h_l436_c23_365b_value;
     device_out_uxn_opcodes_h_l436_c23_365b_phase <= VAR_device_out_uxn_opcodes_h_l436_c23_365b_phase;
     device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l436_c23_365b_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output := device_out_uxn_opcodes_h_l436_c23_365b_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output;
     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l442_c25_764d] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l442_c25_764d_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.vram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l437_c32_9998] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l437_c32_9998_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l439_c31_6c80] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c31_6c80_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l441_c26_36a1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l441_c26_36a1_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l438_c31_d525] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l438_c31_d525_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l444_c24_6018] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l444_c24_6018_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.is_deo_done;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l443_c23_5f48] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l443_c23_5f48_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l440_c29_d5d7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l440_c29_d5d7_return_output := VAR_device_out_uxn_opcodes_h_l436_c23_365b_return_output.device_ram_value;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l444_c24_6018_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l438_c31_d525_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l437_c32_9998_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l441_c26_36a1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l443_c23_5f48_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l442_c25_764d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l439_c31_6c80_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l440_c29_d5d7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l428_c7_e4aa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l428_c7_e4aa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l424_c7_e04c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l424_c7_e04c_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l419_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l419_c7_ca5a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l415_c7_3b9c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l415_c7_3b9c_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l408_c2_1e81] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_cond;
     result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output := result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l447_l403_DUPLICATE_d986 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l447_l403_DUPLICATE_d986_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_745e(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l408_c2_1e81_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l408_c2_1e81_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l447_l403_DUPLICATE_d986_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_745e_uxn_opcodes_h_l447_l403_DUPLICATE_d986_return_output;
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
